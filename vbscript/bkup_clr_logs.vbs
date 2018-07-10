strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
    & "{impersonationLevel=impersonate, (Backup, Security)}!\\" _
        & strComputer & "\root\cimv2")
Set colLogFiles = objWMIService.ExecQuery _
    ("Select * from Win32_NTEventLogFile")
For Each objLogfile in colLogFiles
    strBackupLog = objLogFile.BackupEventLog _
        ("c:\scripts\" & objLogFile.LogFileName & ".evt")
    objLogFile.ClearEventLog()
Next

