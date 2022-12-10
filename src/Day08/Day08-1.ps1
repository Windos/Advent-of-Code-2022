$PuzzleInput = Get-Content -Path $PSScriptRoot\Day08.txt

$LineLength = $PuzzleInput[0].Length - 1

$Visible = 0

foreach ($x in 0..$LineLength) {
    foreach ($y in 0..($PuzzleInput.Length - 1)) {
        if ($x -eq 0 -or $x -eq $LineLength) {
            $Visible++
        } elseif ($y -eq 0 -or $y -eq ($PuzzleInput.Length - 1)) {
            $Visible++
        } else {
            $IsVisibleLeft = $true
            $IsVisibleRight = $true
            $IsVisibleUp = $true
            $IsVisibleDown = $true

            # Left
            foreach ($Left in 0..($x - 1)) {
                if ($PuzzleInput[$y][$Left] -ge $PuzzleInput[$y][$x]) {
                    $IsVisibleLeft = $false
                    break
                }
            }

            # Right
            foreach ($Right in ($x + 1)..$LineLength) {
                if ($PuzzleInput[$y][$Right] -ge $PuzzleInput[$y][$x]) {
                    $IsVisibleRight = $false
                    break
                }
            }

            # Up
            foreach ($Up in 0..($y - 1)) {
                if ($PuzzleInput[$Up][$x] -ge $PuzzleInput[$y][$x]) {
                    $IsVisibleUp = $false
                    break
                }
            }

            # Down
            foreach ($Down in ($y + 1)..($PuzzleInput.Length - 1)) {
                if ($PuzzleInput[$Down][$x] -ge $PuzzleInput[$y][$x]) {
                    $IsVisibleDown = $false
                    break
                }
            }

            if ($IsVisibleLeft -or $IsVisibleRight -or $IsVisibleUp -or $IsVisibleDown) {
                $Visible++
            }
        }
    }
}

$Visible
