Import-Module (Join-Path ".." "ExifWrapper.psm1") -Force

Describe -Name "Attribute Tests" {

    Mock -CommandName exif -ModuleName ExifWrapper -MockWith { 
        "DateandTimeOriginal`t2020:01:02 01:02:03", 
        "Apperture`t2.0" 
    }
    
    Mock -CommandName Get-Item -ModuleName ExifWrapper -MockWith { 
        [System.IO.FileInfo]::new("img.jpg")
    }


    Context "With 2 attributes" {
        $fe = Get-Exif "IMG.jpg" 
        
        It "Has two attribites" {

            $fe | Should -HaveCount 2
        }

        It "Has date as datetime type" {
            $fe.DateandTimeOriginal | Should -HaveType [datetime]
        }
    }

}