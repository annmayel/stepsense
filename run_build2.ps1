$ErrorActionPreference = "Continue"
$log = "C:\Users\stepsense\build_fix2.log"
"=== START2 $(Get-Date -Format o) ===" | Out-File $log -Encoding utf8
"STEP: flutter build apk --release --split-per-abi -v" | Out-File $log -Append -Encoding utf8
& D:\IT-120\flutter\bin\flutter.bat build apk --release --split-per-abi -v 2>&1 | Out-File $log -Append -Encoding utf8
"EXIT build-split: $LASTEXITCODE" | Out-File $log -Append -Encoding utf8
"=== END2 $(Get-Date -Format o) ===" | Out-File $log -Append -Encoding utf8
