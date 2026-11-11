#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if ! command -v flutter >/dev/null 2>&1; then
  echo "Flutter SDK not found in PATH. Install Flutter and run flutter doctor." >&2
  exit 1
fi
# Completes environment-specific Gradle files while retaining lib/ and assets/.
flutter create --platforms=android,web --project-name week_02_student_profile_application .
flutter pub get
printf '\nReady. Use flutter analyze && flutter test && flutter run.\n'
