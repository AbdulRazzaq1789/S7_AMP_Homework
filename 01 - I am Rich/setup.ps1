$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
  throw 'Flutter SDK is not installed or not in PATH. Run flutter doctor.'
}
flutter create --platforms=android,web --project-name week_01_i_am_rich_app .
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
flutter pub get
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Write-Host 'Ready. Next: flutter analyze; flutter test; flutter run'
