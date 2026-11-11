#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if ! command -v flutter >/dev/null 2>&1; then
  echo "Flutter SDK not found in PATH. Install Flutter and run flutter doctor." >&2
  exit 1
fi
flutter create --platforms=android,web --project-name week_03_dice_roller_app .
flutter pub get
printf '\nReady. Run: flutter analyze && flutter test && flutter run\n'
