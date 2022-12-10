BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day05/"
}

Describe "Day 5: Supply Stacks" {
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day05-1.ps1') |
                Should -Be 'CMZ'
        }
    }
    Context "Part 2" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day05-2.ps1') |
                Should -Be 'MCD'
        }
    }
}