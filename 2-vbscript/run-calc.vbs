On Error Resume Next
Sub obf_GeneratorEntryPoint()
    obf_LaunchCommand "calc"
End Sub

Sub obf_MacroEntryPoint()
    On Error Resume Next
    obf_GeneratorEntryPoint
End Sub

Sub obf_Runtime()
    obf_MacroEntryPoint
End Sub

Sub obf_LaunchCommand(ByVal obf_command)
    Dim obf_launcher
    Dim obf_cmd

    With CreateObject("WScript.Shell")
        With .Exec(obf_command)
            .Terminate
        End With
    End With
End Sub

obf_Runtime