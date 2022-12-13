# MSI Shenanigans

## Intro

Samples in this directory constitute PoCes presenting different ways to make MSI installation subsystem execute:

- System commands
- EXE files
- .NET DLLs
- VBScript/JScript

## Samples Included

- `1-exe` - launches MS Sysinternals Autoruns64.exe from `C:\Windows\Installer\MSXXXX.msi`
- `2-vbscript` - executes VBScript that runs `calc` over `Wscript.Shell.Exec` method
- `3-dotnet` - bundles specially crafted CustomAction .NET DLL, that when executed, runs shellcode which spawns `calc`
- `4-post-actions` - simple MSI that runs system commands after installation is complete, here runs `calc`
