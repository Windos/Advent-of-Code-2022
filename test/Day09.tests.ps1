BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day09/"
}

Describe "Day 9: Rope Bridge" {
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day09-1.ps1') |
                Should -Be 88
        }
    }
    Context "Part 2" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day09-2.ps1') |
                Should -Be 36
        }
    }
}