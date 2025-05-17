function Process-Line {
    param(
        [Parameter(Mandatory = $true)]
        [Microsoft.PowerShell.Commands.MatchInfo]$Line
    )

    $lineRangeStart = if ($Line.LineNumber -gt 21) { $Line.LineNumber - 20 } else { 1 }
    $lineRangeEnd = $Line.LineNumber + 20

    return "$($Line.Path):$($lineRangeStart):$($lineRangeEnd):$($Line.LineNumber):$($Line.Line)"
}

function Enhanced-Fzf-Base {
    param(
        [Parameter(Mandatory = $true)]
        [string]$extension,
        [Parameter(Mandatory = $false)]
        [string]$path = $PSScriptRoot
    )

    return Get-ChildItem $path -r -filter *.$extension | Select-String . | ForEach-Object {
        Process-Line $_
    }
}

# For debugging in VS Code.
If ($MyInvocation.InvocationName -ne ".") {
    Enhanced-Fzf-Base
}
