BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day01/"
}

Describe "Day 1: Calorie Counting" {
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day01-1.ps1') |
                Should -Be 24000
        }
    }
    Context "Part 2" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day01-2.ps1') |
                Should -Be 45000
        }
    }
}