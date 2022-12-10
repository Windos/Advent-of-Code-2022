$PuzzleInput = Get-Content -Path $PSScriptRoot\Day10.txt

$Script:Cycle = 1
$Script:X = [double]1

$CheckCycles = @(40, 80, 120, 160, 200, 240)

$Script:CurrentScanline = 0
$Script:Index = 0

$Script:ScanLines = [System.Collections.ArrayList] (
    [System.Collections.ArrayList]::new(40),
    [System.Collections.ArrayList]::new(40),
    [System.Collections.ArrayList]::new(40),
    [System.Collections.ArrayList]::new(40),
    [System.Collections.ArrayList]::new(40),
    [System.Collections.ArrayList]::new(40)
)

function Invoke-Tick {
    $PotentialPixels = @(($Script:X - 1), $Script:X, ($Script:X + 1))

    if ($Script:Index -in $PotentialPixels) {
        $null = $Script:ScanLines[$Script:CurrentScanline].Add('#')
    } else {
        $null = $Script:ScanLines[$Script:CurrentScanline].Add('.')
    }

    if ($Script:Cycle -in $CheckCycles) {
        $Script:CurrentScanline += 1
        $Script:Index = 0
    } else {
        $Script:Index++
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

foreach ($Scanline in $Scanlines) {
    $Scanline -join ''
}
