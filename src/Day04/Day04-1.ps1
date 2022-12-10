$PuzzleInput = Get-Content -Path $PSScriptRoot\Day04.txt

$Sum = 0

foreach ($Pair in $PuzzleInput) {
    $Elf1, $Elf2 = $Pair -split ','
    $ElfArea1 = $Elf1.Split('-')[0]..$Elf1.Split('-')[1]
    $ElfArea2 = $Elf2.Split('-')[0]..$Elf2.Split('-')[1]

    if (((Compare-Object -ReferenceObject $ElfArea1 -DifferenceObject $ElfArea2 | Group-Object -Property 'SideIndicator') | Measure-Object).Count -lt 2) {
        $Sum++
    }
}

$Sum
