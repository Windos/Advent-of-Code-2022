param (
    [string[]] $PuzzleInput
)

$Running = 0
$Elves = @()

foreach ($Item in $PuzzleInput) {
    if ($Item -eq '') {
        $Elves += ,$Running
        $Running = 0
    } else {
        $Running += $Item
    }
}

($Elves | Sort-Object | Select-Object -Last 3 | Measure-Object -Sum).Sum
