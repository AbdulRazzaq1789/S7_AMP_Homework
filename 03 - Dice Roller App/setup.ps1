$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot
if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
  throw "Flutter SDK not found in PATH. Install Flutter and run flutter doctor."
}
flutter create --platforms=android,web --project-name week_03_dice_roller_app .
if ($LASTEXITCODE -ne 0) { throw "flutter create failed" }
flutter pub get
if ($LASTEXITCODE -ne 0) { throw "flutter pub get failed" }
Write-Host "Ready. Run: flutter analyze; flutter test; flutter run"
