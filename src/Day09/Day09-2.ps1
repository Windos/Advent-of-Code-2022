$PuzzleInput = Get-Content -Path $PSScriptRoot\Day09.txt

$Knots = @(
    [PSCustomObject] @{'X' = 0; 'Y' = 0}
    [PSCustomObject] @{'X' = 0; 'Y' = 0}
    [PSCustomObject] @{'X' = 0; 'Y' = 0}
    [PSCustomObject] @{'X' = 0; 'Y' = 0}
    [PSCustomObject] @{'X' = 0; 'Y' = 0}
    [PSCustomObject] @{'X' = 0; 'Y' = 0}
    [PSCustomObject] @{'X' = 0; 'Y' = 0}
    [PSCustomObject] @{'X' = 0; 'Y' = 0}
    [PSCustomObject] @{'X' = 0; 'Y' = 0}
    [PSCustomObject] @{'X' = 0; 'Y' = 0}
)

$Visited = @('0,0')

foreach ($Motion in $PuzzleInput) {
    $Direction, $Quantity = $Motion.Split(' ')

    foreach ($Step in 1..$Quantity) {
        switch ($Direction) {
            'R' {
                $Knots[0].X++
            }
            'L' {
                $Knots[0].X--
            }
            'U' {
                $Knots[0].Y++
            }
            'D' {
                $Knots[0].Y--
            }
        }

        foreach ($Index in 1..9) {
            if (-not ([System.Math]::Abs($Knots[$Index].X - $Knots[$Index - 1].X) -in 0,1 -and [System.Math]::Abs($Knots[$Index].Y - $Knots[$Index - 1].Y) -in 0,1)) {
                if (($Knots[$Index - 1].X - $Knots[$Index].X) -gt 0) {
                    $Knots[$Index].X++
                } elseif (($Knots[$Index - 1].X - $Knots[$Index].X) -lt 0) {
                    $Knots[$Index].X--
                }

                if (($Knots[$Index - 1].Y - $Knots[$Index].Y) -gt 0) {
                    $Knots[$Index].Y++
                } elseif (($Knots[$Index - 1].Y - $Knots[$Index].Y) -lt 0) {
                    $Knots[$Index].Y--
                }
            }
        }

        if ("$($Knots[-1].X),$($Knots[-1].Y)" -notin $Visited) {
            $Visited += ,"$($Knots[-1].X),$($Knots[-1].Y)"
        }
    }
}

$Visited.Count
