$PuzzleInput = Get-Content -Path $PSScriptRoot\Day09.txt

$HeadPos = [PSCustomObject] @{'X' = 0; 'Y' = 0}
$TailPos = [PSCustomObject] @{'X' = 0; 'Y' = 0}

$Visited = @('0,0')

foreach ($Motion in $PuzzleInput) {
    $Direction, $Quantity = $Motion.Split(' ')

    foreach ($Step in 1..$Quantity) {
        switch ($Direction) {
            'R' {
                $HeadPos.X++
            }
            'L' {
                $HeadPos.X--
            }
            'U' {
                $HeadPos.Y++
            }
            'D' {
                $HeadPos.Y--
            }
        }

        if ([System.Math]::Abs($TailPos.X - $HeadPos.X) -in 0,1 -and [System.Math]::Abs($TailPos.Y - $HeadPos.Y) -in 0,1) {

        } else {
            if ($TailPos.Y -eq $HeadPos.Y) {
                switch ($Direction) {
                    'R' {
                        $TailPos.X++
                    }
                    'L' {
                        $TailPos.X--
                    }
                }
            } elseif ($TailPos.X -eq $HeadPos.X) {
                switch ($Direction) {
                    'U' {
                        $TailPos.Y++
                    }
                    'D' {
                        $TailPos.Y--
                    }
                }
            } else {
                if (($HeadPos.X - $TailPos.X) -gt 0) {
                    $TailPos.X++
                } else {
                    $TailPos.X--
                }

                if (($HeadPos.Y - $TailPos.Y) -gt 0) {
                    $TailPos.Y++
                } else {
                    $TailPos.Y--
                }
            }
        }

        if ("$($TailPos.X),$($TailPos.Y)" -notin $Visited) {
            $Visited += ,"$($TailPos.X),$($TailPos.Y)"
        }
    }
}

$Visited.Count
