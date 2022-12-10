$PuzzleInput = Get-Content -Path $PSScriptRoot\Day06.txt

$End = 3

while ($End -lt $PuzzleInput.Length) {
    $TestString = $PuzzleInput[($End - 3)..$End]
    $End++

    if (($TestString | Group-Object | Measure-Object).Count -eq 4) {
        break
    }
}

$End
