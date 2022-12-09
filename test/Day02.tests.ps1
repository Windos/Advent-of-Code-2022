BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day02/"
}

Describe "Day 2: Rock Paper Scissors" {
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day02-1.ps1') |
                Should -Be 15
        }
    }
    Context "Part 2" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day02-2.ps1') |
                Should -Be 12
        }
    }
}