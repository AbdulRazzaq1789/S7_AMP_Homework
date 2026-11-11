$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot
if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
  throw "Flutter SDK is not installed or not in PATH."
}
flutter create --platforms=android,web --project-name week_05_course_detail_screen .
if ($LASTEXITCODE -ne 0) { throw "flutter create failed" }
flutter pub get
if ($LASTEXITCODE -ne 0) { throw "flutter pub get failed" }
Write-Host "Ready. Run: flutter analyze; flutter test; flutter run"
