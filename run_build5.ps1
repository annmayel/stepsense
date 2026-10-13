$ErrorActionPreference = "Continue"
$log = "C:\Users\stepsense\build_fix5.log"
"=== START5 $(Get-Date -Format o) ===" | Out-File $log -Encoding utf8
"STEP: flutter analyze" | Out-File $log -Append -Encoding utf8
& D:\IT-120\flutter\bin\flutter.bat analyze 2>&1 | Out-File $log -Append -Encoding utf8
"EXIT analyze: $LASTEXITCODE" | Out-File $log -Append -Encoding utf8
"STEP: flutter build apk --release --no-tree-shake-icons -v (workaround for IconTreeShaker ConstFinder failure, no code/UI change)" | Out-File $log -Append -Encoding utf8
& D:\IT-120\flutter\bin\flutter.bat build apk --release --no-tree-shake-icons -v 2>&1 | Out-File $log -Append -Encoding utf8
"EXIT build-no-treelike: $LASTEXITCODE" | Out-File $log -Append -Encoding utf8
Get-ChildItem "C:\Users\stepsense\build\app\outputs\flutter-apk\" 2>&1 | Out-File $log -Append -Encoding utf8
"=== END5 $(Get-Date -Format o) ===" | Out-File $log -Append -Encoding utf8
