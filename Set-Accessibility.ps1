<#
    .SYNOPSIS
        Setting up the terminal to be accessible in presentations
        GOAL :  Meet WCAG Level AAA. WCAG Level AAA requires a contrast ratio of at least 7:1 for normal text and 4.5:1 for large text.
        Large text is defined as 14 point (typically 18.66px) and bold or larger, or 18 point (typically 24px) or larger.
        Windows Terminal settings.json if it gets out of wack
        C:\Users\tadd\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
    .EXAMPLE
        .\Set-Accessibility.ps1
#>
[CmdletBinding()]
param
(

) #param
process
{
    function prompt
    {
        $MinutesRemaining = (60-(Get-Date).Minute)
        Switch ($MinutesRemaining)
        {
            {$_ -lt 10} {
                            $BackgroundColor = "Black"
                            $ForeGroundColor = "Red"
                        }
            {$_ -lt 15} {
                            $BackgroundColor = "Black"
                            $ForeGroundColor = "Red"
                        }
            default     {
                            $BackgroundColor = "Black"
                            $ForeGroundColor = "Red"
                        }
        }
        Write-Host ("SPARK ({0}) > " -f $MinutesRemaining ) -Backgroundcolor $BackgroundColor -Foregroundcolor $ForeGroundColor
    }
    Start-Transcript -Path ("C:\Presentations\ComfortableWithPSCustomObjects\{0}_transcript.txt" -f (Get-Date).ToString("yyyyMMddHHmm")) -Append -IncludeInvocationHeader
    $Host.UI.RawUI.WindowTitle = "Comfortable PSCustomObject"
    $Host.UI.RawUI.ForegroundColor = [System.ConsoleColor]::White
    $Host.UI.RawUI.BackgroundColor = [System.ConsoleColor]::Black

    $Host.PrivateData.VerboseForegroundColor = [System.ConsoleColor]::DarkYellow
    #Get-PSReadLineOption
} #process