BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day08/"
}

Describe "Day 8: Treetop Tree House" {
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day08-1.ps1') |
                Should -Be 21
        }
    }
    Context "Part 2" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day08-2.ps1') |
                Should -Be 8
        }
    }
}