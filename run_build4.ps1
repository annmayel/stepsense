$ErrorActionPreference = "Continue"
$log = "C:\Users\stepsense\build_fix4.log"
"=== START4 $(Get-Date -Format o) ===" | Out-File $log -Encoding utf8
"--- gen_snapshot binaries ---" | Out-File $log -Append -Encoding utf8
Get-ChildItem "D:\IT-120\flutter\bin\cache\artifacts\engine\android-arm-release\windows-x64\gen_snapshot*" | Format-Table Name, Length, LastWriteTime | Out-File $log -Append -Encoding utf8
Get-ChildItem "D:\IT-120\flutter\bin\cache\artifacts\engine\android-arm64-release\windows-x64\gen_snapshot*" | Format-Table Name, Length, LastWriteTime | Out-File $log -Append -Encoding utf8
"--- try gen_snapshot --version (arm) ---" | Out-File $log -Append -Encoding utf8
& "D:\IT-120\flutter\bin\cache\artifacts\engine\android-arm-release\windows-x64\gen_snapshot" --version 2>&1 | Out-File $log -Append -Encoding utf8
"EXIT gen_snapshot-arm-version: $LASTEXITCODE" | Out-File $log -Append -Encoding utf8
"--- try gen_snapshot --version (arm64) ---" | Out-File $log -Append -Encoding utf8
& "D:\IT-120\flutter\bin\cache\artifacts\engine\android-arm64-release\windows-x64\gen_snapshot" --version 2>&1 | Out-File $log -Append -Encoding utf8
"EXIT gen_snapshot-arm64-version: $LASTEXITCODE" | Out-File $log -Append -Encoding utf8
"STEP: flutter build apk --release --target-platform android-arm64 -v" | Out-File $log -Append -Encoding utf8
& D:\IT-120\flutter\bin\flutter.bat build apk --release --target-platform android-arm64 -v 2>&1 | Out-File $log -Append -Encoding utf8
"EXIT build-arm64: $LASTEXITCODE" | Out-File $log -Append -Encoding utf8
Get-ChildItem "C:\Users\stepsense\build\app\outputs\flutter-apk\" 2>&1 | Out-File $log -Append -Encoding utf8
"=== END4 $(Get-Date -Format o) ===" | Out-File $log -Append -Encoding utf8
