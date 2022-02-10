<#
    .SYNOPSIS
        Setting up the terminal to be accessible in presentations
        GOAL :  Meet WCAG Level AAA. WCAG Level AAA requires a contrast ratio of at least 7:1 for normal text and 4.5:1 for large text.
                Large text is defined as 14 point (typically 18.66px) and bold or larger, or 18 point (typically 24px) or larger.
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