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
        Get-Command -Name "exif" -ErrorAction Stop
     }

    end { 
        Write-Debug "Get-Exif End"
     }

    process {
        $paramSet = $PSCmdlet.ParameterSetName
        Write-Debug "Get-Exif - ParamSet: $paramSet, Parameters - Path: $Path, File: $File"

        if( $paramSet -eq "File" ) {
            $Path = $File.FullName
        } else {
            $File = Get-Item $Path
        }

        Write-Debug "Get-Exif - after resolution - Path: $Path, File: $File"
        
        (exif -m $Path) | ForEach-Object {
            $name, $value = $_ -split "`t"
            $name = $name -replace'[\(\)\s\-]', ''   

            if($name.startsWith("DateandTime")) {
                $value = Get-Date ($value -replace "^(.*?):(.*?):(.*?) ", "`$1.`$2.`$3 ")
            }

            Write-Debug "Get-Exif - Addind NoteProperty: $name = $value"
            Add-Member -InputObject $File[0] -NotePropertyName $name -NotePropertyValue $value
           }
       $File
    }

}



