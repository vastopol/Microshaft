<#
 
custom user profile

this file MUST follow conventions
name     : Microsoft.PowerShell_profile.ps1
location : $Home\Documents\WindowsPowerShell

#>

# VARIABLES

# determines the maximum number of commands saved in the command history
$MaximumHistoryCount = [int16]::MaxValue

#----------------------------------------

# FUNCTIONS

# creates a new file if it does not exist, or updates the timestamp if it does exist
# pseudo-equivalent to linux "touch" command
Function Update-File()
{
    $file = $args[0]
    if($file -eq $null) 
    {
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        Add-Content $file $null
    }
}

# allows paging of output on terminal, pipe output to function
# function reads from automatic variable "$input"
Function pages() 
{
    $input | Out-Host -Paging
}

#----------------------------------------

# ALIASES

New-Alias l ls
New-Alias touch Update-File

