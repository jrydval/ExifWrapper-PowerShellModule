function Get-Exif {

    [CmdletBinding(DefaultParameterSetName = "File")]   
    param(
        [Parameter(Mandatory = $true,
            Position = 0,
            ParameterSetName = "Path",
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Path to one or more JPG files.")]
        [Alias("FileName")]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Path,
        [Parameter(Mandatory = $true,
            Position = 0,
            ParameterSetName = "File",
            ValueFromPipeline = $true,
            HelpMessage = "File Item or Items.")]
        [Alias("FileItem")]
        [ValidateNotNullOrEmpty()]
        [System.IO.FileInfo[]]
        $File
    )

    begin { 
        Write-Debug "Get-Exif Begin"
        Get-Command -Name "exif" -ErrorAction Stop | Out-Null
    }

    end { 
        Write-Debug "Get-Exif End"
    }

    process {
        $paramSet = $PSCmdlet.ParameterSetName
        Write-Debug "Get-Exif - ParamSet: $paramSet, Parameters - Path: $Path, File: $File"

        if ( $paramSet -eq "File" ) {
            $Path = $File.FullName
        }
        else {
            $File = Get-Item $Path
        }

        Write-Debug "Get-Exif - after resolution - Path: $Path, File: $File"
        
        foreach ($f in $File) {

            $exif = [PSCustomObject]@{
                PSTypeName = "Exif"
            }

            #$exif = @{}

            (exif -m $f.FullName) | ForEach-Object {
                $name, $value = $_ -split "`t"
                $name = $name -replace '[\(\)\s\-]', ''   

                if ($name.startsWith("DateandTime")) {
                    $value = Get-Date ($value -replace "^(.*?):(.*?):(.*?) ", "`$1.`$2.`$3 ")
                }

                Write-Debug "Get-Exif - Addind NoteProperty: $name = $value"

                Add-Member -InputObject $exif -NotePropertyName $name -NotePropertyValue $value
                #$exif.Add($name, $value)
            }
            Add-Member -InputObject $f -NotePropertyName "Exif" -NotePropertyValue $exif
            $f
        }
    }

}



