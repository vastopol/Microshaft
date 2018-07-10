' script to display information about system
' all services installed
' all running processes
' video card information


strComputer =  "."
strProcess  = "Win32_Process"
strService  = "Win32_Service"
strVideo    = "Win32_VideoController"

dim strArr
strArr = Array(strProcess,strService,strVideo)

For Each member in strArr
    Set objWMIService = GetObject("winmgmts:" & _
        "{impersonationLevel=Impersonate}!\\" & strComputer & "\root\cimv2")
    Set colItems = objWMIService.ExecQuery("Select * from " & member)
    Wscript.echo member & ":"
    wscript.echo "--------------------"
    For Each objItem in colItems
        Wscript.Echo objItem.Name
    Next
    wscript.echo
Next
