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