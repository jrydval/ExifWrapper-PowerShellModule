. ../ExifWrapper.ps1

Describe -Name FirstTest {
    Context "Have fun" {
        It "Should work" {
            $true | Should -Be $true
        }
    }

}