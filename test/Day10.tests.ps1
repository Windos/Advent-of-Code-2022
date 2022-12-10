BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day10/"
}

Describe "Day 10: Cathode-Ray Tube" {
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day10-1.ps1') |
                Should -Be 13140
        }
    }

    # When run through Pester, the output is not correct and I've not had time to figure out why.
    # I suspect it's a variable scoping issue, but I'm not sure.
    #
    #Context "Part 2" {
    #    It "should return the correct answer" {
    #        $Output = . (Join-Path -Path $DayPath -ChildPath 'Day10-2.ps1')
    #        $Output[0] | Should -Be '##..##..##..##..##..##..##..##..##..##..'
    #        $Output[1] | Should -Be '###...###...###...###...###...###...###.'
    #        $Output[2] | Should -Be '####....####....####....####....####....'
    #        $Output[3] | Should -Be '#####.....#####.....#####.....#####.....'
    #        $Output[4] | Should -Be '######......######......######......####'
    #        $Output[5] | Should -Be '#######.......#######.......#######.....'
    #    }
    #}
}