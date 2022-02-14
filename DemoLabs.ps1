<#
    .SYNOPSIS
        Demo Labs for Getting Comfortable with PowerShell Custom Object.
#>
#region Setup
    Start-Transcript -Path ("C:\Presentations\ComfortableWithPSCustomObjects\{0}_transcript.txt" -f (Get-Date).ToString("yyyyMMddHHmm")) -Append -IncludeInvocationHeader
    $Host.UI.RawUI.WindowTitle = "Comfortable PSCustomObject"
    $Host.UI.RawUI.ForegroundColor = [System.ConsoleColor]::White
    $Host.UI.RawUI.BackgroundColor = [System.ConsoleColor]::Black
    $Host.PrivateData.VerboseForegroundColor = [System.ConsoleColor]::DarkYellow
    Start-Process '.\Deck\GettingComfortableWithCustomObjectsInPowerShell.ppsx'
#endregion Setup

#region The BIG 3
    <#
        Get-Help
        The `Get-Help` cmdlet displays information about PowerShell concepts and commands, including cmdlets, functions, Common Information Model (CIM) commands, workflows, providers, aliases, and scripts.
        Get-Command
        The `Get-Command` cmdlet gets all commands that are installed on the computer, including cmdlets, aliases, functions, filters, scripts, and applications.
        Get-Member
        The `Get-Member` cmdlet gets the members, the properties and methods, of objects.
    #>
#endregion The BIG 3

#region What is a Custom Object
    Get-Help about_Objects
    <#
        Everything we interact with in PowerShell is an Object.

        There are times when we need to create our own custom collection of properties, methods and types.
    #>
#endregion What is a Custom Object

#region Why use a Custom Object
    <#
        1.
    #>

#endregion Why use a Custom Object

#region Creating Custom Object
    Get-Help about_Object_Creation

#endregion Creating Custom Object

#region about_Type_Accelerators

    Get-Help about_Type_Accelerators -ShowWindow

    # [Array] for [System.Array]
    $MyNewArray = [Array] 1,2,3
    $MyNewArray | Get-Member
    Get-Member -InputObject $MyNewArray

    # [ipaddress]  for [System.Net.IPAddress]
    Get-Member -InputObject $([ipaddress]) -Static
    $MyNewIPaddress = [ipaddress]::Loopback
    $MyNewIPaddress

    # [mailaddress] for [System.Net.Mail.MailAddress]
    Get-Member -InputObject $([mailaddress]) -Static
    $MyNewMailAddress = [mailaddress]::new("tadd@microsoft.com")
    $MyNewMailAddress

    # [PSCustomObject] for [System.Management.Automation.PSObject]
    Get-Member -InputObject $([PSCustomObject]) -Static
    $MyNewCustomObject = [PSCustomObject]::new()
    $MyNewCustomObject
    Get-Member -InputObject $MyNewCustomObject -Force

#endregion about_Type_accelerators

#region Get-Help about_Hash_Tables
    Get-Help about_Hash_Tables -ShowWindow
    <#
        To create a hash table, follow these guidelines:

        -   Begin the hash table with an at sign (@).
        -   Enclose the hash table in braces ({}).
        -   Enter one or more key/value pairs for the content of the hash table.
        -   Use an equal sign (=) to separate each key from its value.
        -   Use a semicolon (;) or a line break to separate the key/value pairs.
        -   Key that contains spaces must be enclosed in quotation marks. Values
            must be valid PowerShell expressions. Strings must appear in quotation
            marks, even if they do not include spaces.
        -   To manage the hash table, save it in a variable.
        -   When assigning an ordered hash table to a variable, place the [ordered]
            attribute before the "@" symbol. If you place it before the variable
            name, the command fails.
    #>

    $MyNewHashTable = @{
        "First Name" = "Tadd"
        "Middle Initials" = "E."
        "Last Name" = "Dawson"
    } # $MyNewHashTable
    $MyNewHashTable | Get-Member
    # System.Collections.Hashtabl
#endregion Get-Help about_Hash_Tables

#region "You as a PowerShell Custom Object"

    <#
        Create a custom object with the following properties, using your information as the values.
        First Name
        Middle Initial
        Last Name
        Email Address
        Favorite PowerShell Cmdlet
    #>

    Get-Help about_Object_Creation -ShowWindow

    # My new custom object is going to be called me, using a type_accelerator and some common practices
    $Me = [PSCustomObject]@{
        "First Name"                  = "Tadd"
        "Middle Initial"              = "E."
        "Last Name"                   = "Dawson"
        "Email Address"               = "Tadd@Microsoft.com"
        Twitter                       = "@drtadd"
        "Favorite PowerShell Cmdlet"  = "Get-Member"
    }

    # Inpect
    $Me
    <#
        First Name                 : Tadd
        Middle Initial             : E.
        Last Name                  : Dawson
        Email Address              : Tadd@Microsoft.com
        Twitter                    : @drtadd
        Favorite PowerShell Cmdlet : Get-Membe
    #>
    # What type is our new object?
    $Me.GetType().Name
    # PSCustomObject

    # What properties does it have?
    Get-Member -InputObject $Me

    # What are the types of the properties?
    <#
        Get-Member -InputObject $Me -MemberType Properties

        TypeName: System.Management.Automation.PSCustomObject

        Name                       MemberType   Definition
        ----                       ----------   ----------
        Email Address              NoteProperty string Email Address=Tadd@Microsoft.com
        Favorite PowerShell Cmdlet NoteProperty string Favorite PowerShell Cmdlet=Get-Member
        First Name                 NoteProperty string First Name=Tadd
        Last Name                  NoteProperty string Last Name=Dawson
        likesChocolate             NoteProperty string likesChocolate=True
        Middle Initial             NoteProperty string Middle Initial=E.
        Twitter                    NoteProperty string Twitter=@drtadd
    #>

    # Add         likesChocolate                = "True" to the custom object
    Get-Help Add-Member -ShowWindow
    $Me | Add-Member -Name likesChocolate -Value "True" -MemberType NoteProperty


    # There are two (2) properties in the list that have a better .Net type than string, which ones?
    # likesChocolate, Email Address

    $Me = [PSCustomObject]@{
        "First Name"                  = "Tadd"
        "Middle Initial"              = "E."
        "Last Name"                   = "Dawson"
        # "Email Address"               = "Tadd@Microsoft.com"
        "Email Address"               = [mailaddress]::new("Tadd@Microsoft.com")
        Twitter                       = "@drtadd"
        "Favorite PowerShell Cmdlet"  = "Get-Member"
        likesChocolate                = [Boolean] "True"
    }

    $Me
    <#
        Output "looks" the same as before

        First Name                 : Tadd
        Middle Initial             : E.
        Last Name                  : Dawson
        Email Address              : Tadd@Microsoft.com
        Twitter                    : @drtadd
        Favorite PowerShell Cmdlet : Get-Member
        likesChocolate             : True
    #>

    Get-Member -InputObject $Me -MemberType Properties

    <#
        NOTE the different defintion of Email Address and likesChocolate
        bool likesChocolate=True
            translation, the property likesChocolate returns a boolean and its current value is $true
            $Me.likesChocolate
        mailaddress Email Address=Tadd@Microsoft.com
            translation, the property "Email Address" returns a [mailaddress] type accelerator! has additional properties, etc
            $Me."Email Address"
                DisplayName User Host          Address
                ----------- ---- ----          -------
                            Tadd Microsoft.com Tadd@Microsoft.com
        TypeName: System.Management.Automation.PSCustomObject

        Name                       MemberType   Definition
        ----                       ----------   ----------
        Email Address              NoteProperty mailaddress Email Address=Tadd@Microsoft.com
        Favorite PowerShell Cmdlet NoteProperty string Favorite PowerShell Cmdlet=Get-Member
        First Name                 NoteProperty string First Name=Tadd
        Last Name                  NoteProperty string Last Name=Dawson
        likesChocolate             NoteProperty bool likesChocolate=True
        Middle Initial             NoteProperty string Middle Initial=E.
        Twitter                    NoteProperty string Twitter=@drtadd

    #>

    <#
        Going great, but my boss is a stickler on the order of items that are returned and it must be
            First Name                 : Tadd
            Middle Initial             : E.
            Last Name                  : Dawson
            Email Address              : Tadd@Microsoft.com
            Twitter                    : @drtadd
            Favorite PowerShell Cmdlet : Get-Member
            likesChocolate             : True

            Sure Boss, just type in the command below to get the order....
    #>
    $Me | Select-Object "First Name","Middle Initial","Last Name","Email Address", Twitter,"Favorite PowerShell Cmdlet", likesChocolate

    # Well, that didn't go well. Hmm,
    Get-Help about_Hash_Tables -ShowWindow
    # Search for ordered, Bam! hug the hashtable, then add [ordered]

    $Me = [PSCustomObject]([ordered]@{
        "First Name"                  = "Tadd"
        "Middle Initial"              = "E."
        "Last Name"                   = "Dawson"
        # "Email Address"               = "Tadd@Microsoft.com"
        "Email Address"               = [mailaddress]::new("Tadd@Microsoft.com")
        Twitter                       = "@drtadd"
        "Favorite PowerShell Cmdlet"  = "Get-Member"
        likesChocolate                = [Boolean] "True"
    })

    $Me

    # A practice I follow during Data Extract Translate and Load processes (ETL)

    # Create a custom object, I don't care about order of the property names, I do care about type
    # "GivenName", "MiddleInitial", "SurName", "Twitter", "Email"
    $ObjectsIamProcessing= Import-Csv .\Me.csv

    <#
        example
        {
            "First Name": "Tadd",
            "Middle Initials": "E.",
            "Last Name": "Dawson",
            "Cmdlet" : "Get-Member",
            "Chocolate" : "Yes"
        }
    #>
    $FavoriteCmdletAndChocolate = Get-Content .\Me.json | ConvertFrom-Json

    $Processed = ForEach ($ObjectIamProcessing in $ObjectsIamProcessing)
    {
        # Simplified, need for tighter match, Middle Initial, Lat Name
        $JoinObject = $FavoriteCmdletAndChocolate |
                        Where-Object {$_."First Name" -eq $ObjectIamProcessing.GivenName}

        [PSCustomObject]@{
            ETLDate                       = (Get-Date)
            RunOn                         = $env:COMPUTERNAME
            RunBy                         = $env:USERNAME
            WorkingDirectory              = $PWD
            "First Name"                  = [String] $ObjectIamProcessing.GivenName
            "Middle Initial"              = [String] $ObjectIamProcessing.MiddleInitial
            "Last Name"                   = [String] $ObjectIamProcessing.SurName
            "Email Address"               = [mailaddress]::new($ObjectIamProcessing.Email)
            Twitter                       = [String] $ObjectIamProcessing.Twitter
            "Favorite PowerShell Cmdlet"  = [String] $JoinObject.Cmdlet
            likesChocolate                = [Boolean] $(if($JoinObject.Chocolate -eq "Yes"){$true}else{$false})
        } # PSCustomObject
    } # ForEach ($ObjectIamProcessing in $ObjectsIamProcessing)

    # Send to Out-GridView and pick one result to send along?
    $Processed | Out-GridView -PassThru
    # Convert the processed items to Json
    $Processed | ConvertTo-Json
    # Convert the processed items to Json as compressed objects and write to a file
    $Processed | ConvertTo-Json -Compress | Out-File processed.json
    # Export the processed items as csv
    $Processed | Export-Csv processed.csv -NoTypeInformation
#endregion "You as a PowerShell Custom Object"