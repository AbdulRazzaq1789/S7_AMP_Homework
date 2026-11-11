$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
  throw 'Flutter SDK is not available in PATH. Install Flutter and retry.'
}
flutter create --platforms=android,web --project-name week_07_interactive_product_card .
if ($LASTEXITCODE -ne 0) { throw 'flutter create failed' }
flutter pub get
if ($LASTEXITCODE -ne 0) { throw 'flutter pub get failed' }
Write-Host 'Ready. Run flutter analyze, flutter test, and flutter run.'
