BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day07/"
}

Describe "Day 7: No Space Left On Device" {
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day07-1.ps1') |
                Should -Be 95437
        }
    }
    Context "Part 2" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day07-2.ps1') |
                Should -Be 24933642
        }
    }
}