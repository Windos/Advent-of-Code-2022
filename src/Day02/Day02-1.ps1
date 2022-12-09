$PuzzleInput = Get-Content -Path $PSScriptRoot\Day02.txt

$Score = 0

foreach ($Line in $PuzzleInput) {
    $Them, $Me = $Line -split ' '

    $RoundScore = switch ($Me) {
        'X' {1}
        'Y' {2}
        'Z' {3}
    }

    $RoundScore += switch ($Them) {
        'A' {
            switch ($Me) {
                'X' {3}
                'Y' {6}
                'Z' {0}
            }
        }
        'B' {
            switch ($Me) {
                'X' {0}
                'Y' {3}
                'Z' {6}
            }
        }
        'C' {
            switch ($Me) {
                'X' {6}
                'Y' {0}
                'Z' {3}
            }
        }
    }

    $Score += $RoundScore
}

$Score
