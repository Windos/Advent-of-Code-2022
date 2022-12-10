$PuzzleInput = Get-Content -Path $PSScriptRoot\Day03.txt

$Sum = 0

foreach ($Rucksack in $PuzzleInput) {
    $Compartment1 = ($Rucksack.Substring(0,$Rucksack.Length / 2)).ToCharArray() | Select-Object -Unique
    $Compartment2 = ($Rucksack.Substring($Rucksack.Length / 2)).ToCharArray() | Select-Object -Unique

    $Duplicates = (Compare-Object -ReferenceObject $Compartment1 -DifferenceObject $Compartment2 -ExcludeDifferent -IncludeEqual).InputObject

    foreach ($Duplicate in $Duplicates) {
        if ([int]$Duplicate -ge 97) {
            $Sum += ([int]$Duplicate - 96)
        } else {
            $Sum += ([int]$Duplicate - 38)
        }
    }
}

$Sum
