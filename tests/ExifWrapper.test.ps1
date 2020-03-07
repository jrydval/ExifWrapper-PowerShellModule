Import-Module (Join-Path ".." "ExifWrapper.psm1") -Force

Describe -Name FirstTest {

    Mock -CommandName exif -MockWith { 
        "DateandTimeOriginal`t2020:01:02 01:02:03", 
        "Apperture`t2.0" 
    }
    Mock -CommandName Get-Item -MockWith { 
        New-Object [PSCustomObject]
    }


    Context "Have fun" {
        It "Should work" {
            $fe = Get-Exif "IMG.jpg" 
            $fe | Should -HaveCount 2
        }
    }

}