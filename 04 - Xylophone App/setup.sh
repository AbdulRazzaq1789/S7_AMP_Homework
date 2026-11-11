#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if ! command -v flutter >/dev/null 2>&1; then
  echo "Flutter SDK not found. Install Flutter, run flutter doctor, then rerun this script." >&2
  exit 1
fi
# Generate SDK-matched build files/Gradle wrapper while preserving custom lib/assets.
flutter create --platforms=android,web --project-name week_04_xylophone_app .
flutter pub get
printf '\nSetup complete. Commands: flutter analyze | flutter test | flutter run\n'
