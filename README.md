# ComfortableWithPSCustomObjects
Getting Comfortable with Custom Objects in PowerShell

## Outline
1. What are custom objects in PowerShell?
2. Why use custom objects?
    1. Beginning with the end in mine
    2. Packaging
    3. The Pipeline
    4. "Code Review" story
3. Getting information on using custom objects
    1.  https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_type_accelerators?view=powershell-5.1 
        1.  pscustomobject	System.Management.Automation.PSObject
    2. Get-Help about_Objects
        1. Key Points 
            1. Objects have TYPES, PROPERTIES, AND METHODS
    3. Get-Help about_Hash_Tables
    4. Get-Help about_Methods
    5. Get-Help about_Object_Creation
    6. Get-Help about_Properties
    7. Get-Help about_Pipelines
    8. Get-Command Get-Member
        1. Get-Command -Noun Member
            1. Get-Help Add-Member
    9. Get-Help Get-Member
4. Creating our first custom object
    1. New-Object
    2. Class and Hashtable
5. Inspecting our first custom object
6. Getting property values from our custom object
7. Setting property values on our custom object
8. Adding properties to our custom object
