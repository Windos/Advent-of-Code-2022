$PuzzleInput = Get-Content -Path $PSScriptRoot\Day01.txt

$Max = 0
$Running = 0

foreach ($Item in $PuzzleInput) {
    if ($Item -eq '') {
        if ($Running -gt $Max) {$Max = $Running}
        $Running = 0
    } else {
        $Running += $Item
    }
}

$Max
