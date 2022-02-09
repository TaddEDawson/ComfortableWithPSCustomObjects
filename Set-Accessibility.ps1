<#
    .SYNOPSIS
        Setting up the terminal to be accessible in presentations
    .EXAMPLE
        .\Set-Accessibility.ps1
#>
[CmdletBinding()]
param
(

)
process
{
    $Host.UI.RawUI.WindowTitle = "Comfortable PSCustomObject"
    $Host.UI.RawUI.ForegroundColor = [System.ConsoleColor]::White
    $Host.UI.RawUI.BackgroundColor = [System.ConsoleColor]::Black

    $Host.PrivateData.VerboseForegroundColor = [System.ConsoleColor]::DarkYellow

}