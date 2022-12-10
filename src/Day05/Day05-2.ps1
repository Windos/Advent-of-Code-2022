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
        $Letters = $Stacks[[int]$Matches.from][0..([int]$Matches.qty - 1)] -join ''

        $Stacks[[int]$Matches.to] = $Letters + $Stacks[[int]$Matches.to]
        $Stacks[[int]$Matches.from] = $Stacks[[int]$Matches.from].Substring([int]$Matches.qty)
    }
}

($Stacks.Keys | Sort-Object | ForEach-Object {$Stacks[$_][0]}) -join ''
