BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day03/"
}

Describe "Day 3: Rucksack Reorganization" {
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day03-1.ps1') |
                Should -Be 157
        }
    }
    Context "Part 2" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day03-2.ps1') |
                Should -Be 70
        }
    }
}