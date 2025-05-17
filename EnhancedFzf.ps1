. "$($PSScriptRoot)\EnhancedFzfBase.ps1"

function Enhanced-Fzf {
    param(
        [Parameter(Mandatory = $true)]
        [string]$extension,
        [Parameter(Mandatory = $false)]
        [string]$path = $(Get-Location)
    )
    Enhanced-Fzf-Base $extension $path | fzf --delimiter=';' --preview "bat --color=always --style=numbers --line-range {2}:{3} --highlight-line {4} {1}"
}

# For debugging in VS Code.
If ($MyInvocation.InvocationName -ne ".") {
    Enhanced-Fzf
}
