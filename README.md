# MSI Shenanigans

This repository contains Proof of Concept code and harmless weaponised packages representing various weaponisation strategies that Threat Actors abuse in Windows Installer MSI format.

Supplemental blog post can be found here:

- [MSI Shenanigans. Part 1 - Offensive Capabilities Overview](https://mgeeky.tech/msi-shenanigans-part-1/)

## Intro

Samples in this directory constitute PoCes presenting different ways to make MSI installation subsystem execute:

- EXE files
- VBScript/JScript
- .NET DLLs
- System commands

## Samples Included

- `1-exe` - launches MS Sysinternals Autoruns64.exe from `C:\Windows\Installer\MSXXXX.msi`
- `2-vbscript` - executes VBScript that runs `calc` over `Wscript.Shell.Exec` method
- `3-dotnet` - bundles specially crafted CustomAction .NET DLL, that when executed, runs shellcode which spawns `calc`
- `4-post-actions` - simple MSI that runs system commands after installation is complete, here runs `calc`


---

### ☕ Show Support ☕

This and other projects are outcome of sleepless nights and **plenty of hard work**. If you like what I do and appreciate that I always give back to the community,
[Consider buying me a coffee](https://github.com/sponsors/mgeeky) _(or better a beer)_ just to say thank you! 💪 

---

```
Mariusz Banach / mgeeky, (@mariuszbit)
<mb [at] binary-offensive.com>
```