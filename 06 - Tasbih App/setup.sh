#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if ! command -v flutter >/dev/null 2>&1; then
  echo "Flutter SDK is not in PATH. Install Flutter and try again." >&2
  exit 1
fi
flutter create --platforms=android,web --project-name week_06_tasbih_app .
flutter pub get
printf 'Setup completed. Try: flutter analyze && flutter test && flutter run\n'
