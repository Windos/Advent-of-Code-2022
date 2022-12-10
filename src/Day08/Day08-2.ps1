$PuzzleInput = Get-Content -Path $PSScriptRoot\Day08.txt

$LineLength = $PuzzleInput[0].Length - 1

$Scores = @()

foreach ($x in 0..$LineLength) {
    foreach ($y in 0..($PuzzleInput.Length - 1)) {
        $DistanceVisibleLeft = 0
        $DistanceVisibleRight = 0
        $DistanceVisibleUp = 0
        $DistanceVisibleDown = 0

        # Left
        if ($x -ne 0) {
            foreach ($Left in ($x - 1)..0) {
                $DistanceVisibleLeft++
                if ($PuzzleInput[$y][$Left] -ge $PuzzleInput[$y][$x]) {
                    break
                }
            }
        }

        # Right
        if ($x -ne $LineLength) {
            foreach ($Right in ($x + 1)..$LineLength) {
                $DistanceVisibleRight++
                if ($PuzzleInput[$y][$Right] -ge $PuzzleInput[$y][$x]) {
                    break
                }
            }
        }

        # Up
        if ($y -ne 0) {
            foreach ($Up in ($y - 1)..0) {
                $DistanceVisibleUp++
                if ($PuzzleInput[$Up][$x] -ge $PuzzleInput[$y][$x]) {
                    break
                }
            }
        }

        # Down
        if ($y -ne ($PuzzleInput.Length - 1)) {
            foreach ($Down in ($y + 1)..($PuzzleInput.Length - 1)) {
                $DistanceVisibleDown++
                if ($PuzzleInput[$Down][$x] -ge $PuzzleInput[$y][$x]) {
                    break
                }
            }
        }


        $Scores += ,($DistanceVisibleLeft * $DistanceVisibleRight * $DistanceVisibleUp * $DistanceVisibleDown)
    }
}

($Scores | Sort-Object -Descending)[0]
