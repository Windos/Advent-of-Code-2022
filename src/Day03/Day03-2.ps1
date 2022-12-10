$PuzzleInput = Get-Content -Path $PSScriptRoot\Day03.txt

$Sum = 0

$GroupContent = @()

foreach ($Rucksack in $PuzzleInput) {
    $GroupContent += , @(($Rucksack).ToCharArray() | Select-Object -Unique)

    if ($GroupContent.Count -ge 3) {
        $FirstDuplicates = (Compare-Object -ReferenceObject $GroupContent[0] -DifferenceObject $GroupContent[1] -ExcludeDifferent -IncludeEqual).InputObject
        $Duplicates = (Compare-Object -ReferenceObject $FirstDuplicates -DifferenceObject $GroupContent[2] -ExcludeDifferent -IncludeEqual).InputObject

        foreach ($Duplicate in $Duplicates) {
            if ([int]$Duplicate -ge 97) {
                $Sum += ([int]$Duplicate - 96)
            } else {
                $Sum += ([int]$Duplicate - 38)
            }
        }

        $GroupContent = @()
    }
}

$Sum
