Import-Module oh-my-posh
Set-PoshPrompt -Theme gmay

Invoke-Expression (& { (lua $HOME/z.lua/z.lua --init powershell) -join "`n" })

New-Alias which Get-Command