$PuzzleInput = Get-Content -Path $PSScriptRoot\Day05.txt

$Stacks = @{}

foreach ($Line in $PuzzleInput) {
    if ($Line -match '\[\w\]') {
        Select-String '(\s{3}|\[\w\])(\s)?' -InputObject $Line -AllMatches | ForEach-Object {
            $Stack = 1
            foreach ($Match in $_.Matches) {
                if ($Match.Value -match '\w') {
                    $Stacks[$Stack] = "$($Stacks[$Stack])" + "$($matches.Values[0])"
                }
                $Stack++
            }
        }
    } elseif ($Line -match 'move (?<qty>\d+) from (?<from>\d) to (?<to>\d)') {
        for ($i = 0; $i -lt [int]$Matches.qty; $i++) {
            $Letter = $Stacks[[int]$Matches.from][0]

            if ($Stacks[[int]$Matches.to].Length -gt 0) {
                $Stacks[[int]$Matches.to] = $Letter + $Stacks[[int]$Matches.to]
            } else {
                $Stacks[[int]$Matches.to] = $Letter
            }

            if ($Stacks[[int]$Matches.from].Length -gt 1) {
                $Stacks[[int]$Matches.from] = $Stacks[[int]$Matches.from].Substring(1, ($Stacks[[int]$Matches.from].Length - 1))
            } else {
                $Stacks[[int]$Matches.from] = ''
            }
        }
    }
}

($Stacks.Keys | Sort-Object | ForEach-Object {$Stacks[$_][0]}) -join ''
