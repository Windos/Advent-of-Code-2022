$PuzzleInput = Get-Content -Path $PSScriptRoot\Day02.txt

$Score = 0

$Rock = 1
$Paper = 2
$Scissors = 3

foreach ($Line in $PuzzleInput) {
    $Them, $Me = $Line -split ' '

    $RoundScore = switch ($Me) {
        'X' {0}
        'Y' {3}
        'Z' {6}
    }

    $RoundScore += switch ($Them) {
        'A' {
            switch ($Me) {
                'X' {$Scissors}
                'Y' {$Rock}
                'Z' {$Paper}
            }
        }
        'B' {
            switch ($Me) {
                'X' {$Rock}
                'Y' {$Paper}
                'Z' {$Scissors}
            }
        }
        'C' {
            switch ($Me) {
                'X' {$Paper}
                'Y' {$Scissors}
                'Z' {$Rock}
            }
        }
    }

    $Score += $RoundScore
}

$Score
