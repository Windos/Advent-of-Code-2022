$PuzzleInput = Get-Content -Path $PSScriptRoot\Day06.txt

$End = 13

while ($End -lt $PuzzleInput.Length) {
    $TestString = $PuzzleInput[($End - 13)..$End]
    $End++

    if (($TestString | Group-Object | Measure-Object).Count -eq 14) {
        break
    }
}

$End

