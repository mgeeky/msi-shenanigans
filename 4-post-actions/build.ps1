$curDir = (pwd)
$projName = "sample4-customaction-run-calc.wxs"
$outMsi = "sample4-customaction-run-calc.msi"

$candle = Join-Path -Path $curDir -ChildPath "..\tools\wix\candle.exe"
$light = Join-Path -Path $curDir -ChildPath "..\tools\wix\light.exe"
$projectPath = Join-Path -Path $curDir -ChildPath $projName
$objPath = $projectPath -Replace ".wxs", ".wixobj"
$outMsiPath = Join-Path -Path $curDir -ChildPath $outMsi

Write-Host "`n[+] Step 1: Compiling .wxs into .wixobj with Candle..." -ForegroundColor green
& "$candle" "$projectPath"

Write-Host "`n[+] Step 2: Linking .wixobj into .msi with Light..." -ForegroundColor green
& "$light" -ext WixUIExtension -cultures:en-us -dcl:high -out "$outMsiPath" "$objPath"

del "$curDir\*.wixpdb"
del "$curDir\*.wixobj"

Write-Host "`n[+] Done." -ForegroundColor green