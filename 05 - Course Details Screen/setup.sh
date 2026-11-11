#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if ! command -v flutter >/dev/null 2>&1; then
  echo "Flutter SDK is not installed or not in PATH." >&2
  exit 1
fi
flutter create --platforms=android,web --project-name week_05_course_detail_screen .
flutter pub get
printf '\nProject initialized. Run: flutter analyze && flutter test && flutter run\n'
