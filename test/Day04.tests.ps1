BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day04/"
}

Describe "Day 4: Camp Cleanup" {
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day04-1.ps1') |
                Should -Be 2
        }
    }
    Context "Part 2" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day04-2.ps1') |
                Should -Be 4
        }
    }
}