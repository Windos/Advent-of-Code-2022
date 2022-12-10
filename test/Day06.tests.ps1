BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day06/"
}

Describe "Day 6: Tuning Trouble" {
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day06-1.ps1') |
                Should -Be 7
        }
    }
    Context "Part 2" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day06-2.ps1') |
                Should -Be 19
        }
    }
}