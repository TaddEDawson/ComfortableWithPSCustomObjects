<#
    .SYNOPSIS
        Setting up the terminal to be accessible in presentations
    .EXAMPLE
        .\Set-Accessibility.ps1
#>
[CmdletBinding()]
param
(

) #param
process
{
    Start-Transcript -Path C:\Presentations\ComfortableWithPSCustomObjects\transcript.txt -Append -IncludeInvocationHeader
    $Host.UI.RawUI.WindowTitle = "Comfortable PSCustomObject"
    $Host.UI.RawUI.ForegroundColor = [System.ConsoleColor]::White
    $Host.UI.RawUI.BackgroundColor = [System.ConsoleColor]::Black

    $Host.PrivateData.VerboseForegroundColor = [System.ConsoleColor]::DarkYellow
    Get-PSReadLineOption
} #process