$ErrorActionPreference = "Continue"
$log = "C:\Users\stepsense\build_fix.log"
"=== START $(Get-Date -Format o) ===" | Out-File $log -Encoding utf8
"STEP: flutter clean" | Out-File $log -Append -Encoding utf8
& D:\IT-120\flutter\bin\flutter.bat clean 2>&1 | Out-File $log -Append -Encoding utf8
"EXIT clean: $LASTEXITCODE" | Out-File $log -Append -Encoding utf8
"STEP: flutter pub get" | Out-File $log -Append -Encoding utf8
& D:\IT-120\flutter\bin\flutter.bat pub get 2>&1 | Out-File $log -Append -Encoding utf8
"EXIT pubget: $LASTEXITCODE" | Out-File $log -Append -Encoding utf8
"STEP: flutter analyze" | Out-File $log -Append -Encoding utf8
& D:\IT-120\flutter\bin\flutter.bat analyze 2>&1 | Out-File $log -Append -Encoding utf8
"EXIT analyze: $LASTEXITCODE" | Out-File $log -Append -Encoding utf8
"STEP: flutter build apk --release" | Out-File $log -Append -Encoding utf8
& D:\IT-120\flutter\bin\flutter.bat build apk --release -v 2>&1 | Out-File $log -Append -Encoding utf8
"EXIT build: $LASTEXITCODE" | Out-File $log -Append -Encoding utf8
"=== END $(Get-Date -Format o) ===" | Out-File $log -Append -Encoding utf8
