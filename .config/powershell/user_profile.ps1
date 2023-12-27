# Prompt
Import-Module posh-git

# Load prompt config
$THEMES_PATH = 'C:\Users\crist_4u77\AppData\Local\Programs\oh-my-posh\themes'
$PROMPT_CONFIG = Join-Path -Path $THEMES_PATH -ChildPath 'clean-detailed.omp.json'
oh-my-posh init pwsh --config $PROMPT_CONFIG | Invoke-Expression

# Icons
Import-Module Terminal-Icons

# PSReadLine
# Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# PSFzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Load Alias
. $env:USERPROFILE\.config\powershell\user_alias.ps1

# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExcludeProperty Path -ErrorAction SilentlyContinue    
}
