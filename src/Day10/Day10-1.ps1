$PuzzleInput = Get-Content -Path $PSScriptRoot\Day10.txt

$Script:Cycle = 1
$Script:X = [double]1

$CheckCycles = @(20, 60, 100, 140, 180, 220)

$Script:Values = @()

function Invoke-Tick {
    if ($Script:Cycle -in $CheckCycles) {
        $Script:Values += ,($Script:Cycle * $X)
    }

    $Script:Cycle += 1
}

foreach ($Instruction in $PuzzleInput) {
    Invoke-Tick

    if ($Instruction -match 'addx (?<adjustment>[-\d]+)') {
        Invoke-Tick
        $X += [double]$Matches.adjustment
    }
}

($Values | Measure-Object -Sum).Sum
