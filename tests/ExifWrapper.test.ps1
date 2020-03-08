Import-Module (Join-Path ".." "ExifWrapper.psm1") -Force

Describe -Name "Attribute Tests" {

    Mock -CommandName exif -ModuleName ExifWrapper -MockWith { 
        "0x9003`t2020:01:02 01:02:03", 
        "0x829a`t2.0",
        "Last line"
    }
    
    Mock -CommandName Get-Item -ModuleName ExifWrapper -MockWith { 
        [System.IO.FileInfo]::new("img.jpg")
    }


    Context "With 2 attributes" {
        $fe = Get-Exif "img.jpg" 

        It "Has exif property" {
            $fe.Exif | Should -Not -BeNullOrEmpty
        }
        
        It "Has ExposureTime attribute" {
            $fe.Exif.ExposureTime | Should -Be "2.0"
        }

        It "Has DateandTime as datetime type" {
            $fe.Exif.DateandTimeOriginal | Should -HaveType [datetime]
        }
    }

}