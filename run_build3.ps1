$ErrorActionPreference = "Continue"
$log = "C:\Users\stepsense\build_fix3.log"
"=== START3 $(Get-Date -Format o) ===" | Out-File $log -Encoding utf8
"STEP: flutter build apk --debug -v (diagnostic: does debug also fail in gen_snapshot?)" | Out-File $log -Append -Encoding utf8
& D:\IT-120\flutter\bin\flutter.bat build apk --debug -v 2>&1 | Out-File $log -Append -Encoding utf8
"EXIT build-debug: $LASTEXITCODE" | Out-File $log -Append -Encoding utf8
"=== END3 $(Get-Date -Format o) ===" | Out-File $log -Append -Encoding utf8
