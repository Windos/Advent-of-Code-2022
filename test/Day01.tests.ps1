BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day01/"
}

Describe "Day 1: Calorie Counting" {
    BeforeAll {
        $PuzzleInput = @(
            1000
            2000
            3000

            4000

            5000
            6000

            7000
            8000
            9000

            10000
        )
    }
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day01-1.ps1') PuzzleInput $PuzzleInput |
                Should -Be 24000
        }
    }
    Context "Part 2" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day01-2.ps1') PuzzleInput $PuzzleInput |
                Should -Be 45000
        }
    }
}