# This one stumped me, and I ended up taking _very_ heavy from Chris Dent's solution
# Please check out his repo at: https://github.com/indented-automation/AoC

$PuzzleInput = Get-Content -Path $PSScriptRoot\Day07.txt

$Files = @{}
$Path = [System.Collections.Generic.Stack[string]]::new()

foreach ($Line in $PuzzleInput) {
    if ($Line -match '\$ cd (?<path>.+)') {
        switch ($Matches.path) {
            '/' {
                $Path.Push('root')
            }
            '..' {
                $null = $Path.Pop()
            }
            default {
                $Path.Push($Matches.path)
            }
        }
    } elseif ($Line -eq '$ ls') {
        $CurrentPath = ([string[]]$Path)[($Path.Count)..0] -join '\'

        $Files[$CurrentPath] = [PSCustomObject]@{
            Name      = Split-Path $CurrentPath -Leaf
            FullName  = $CurrentPath
            Children  = [System.Collections.Generic.List[object]]::new()
            Files     = [System.Collections.Generic.List[object]]::new()
            Parent    = $Files[(Split-Path $CurrentPath -Parent)]
            Size      = 0
            TotalSize = 0
        }
    } elseif ($Line -match 'dir (?<dir>.+)') {
        $Files[$CurrentPath].Children.Add(
            [PSCustomObject]@{
                Name     = $Matches.dir
                FullName = ($CurrentPath, $Matches.dir -join '\')
            }
        )
    } elseif ($Line -match '(?<size>\d+) (?<name>.+)') {
        $FileSize = [long]$Matches.size

        $Files[$CurrentPath].Files.Add(
            [PSCustomObject]@{
                Name = $Matches.name
                Size = $FileSize
            }
        )

        $Files[$CurrentPath].Size += $FileSize

        $Parent = $Files[$CurrentPath]
        while ($Parent) {
            $Parent.TotalSize += $FileSize
            $Parent = $Parent.Parent
        }
    }
}

($Files.Values | Where-Object TotalSize -le 100000 | Measure-Object TotalSize -Sum).Sum
