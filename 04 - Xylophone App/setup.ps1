$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot
if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
  throw "Flutter SDK not found. Install Flutter and add it to PATH."
}
flutter create --platforms=android,web --project-name week_04_xylophone_app .
if ($LASTEXITCODE -ne 0) { throw "flutter create failed" }
flutter pub get
if ($LASTEXITCODE -ne 0) { throw "flutter pub get failed" }
Write-Host "Setup complete: flutter analyze; flutter test; flutter run"
