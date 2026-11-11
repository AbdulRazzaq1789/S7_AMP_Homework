#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if ! command -v flutter >/dev/null 2>&1; then
  echo "Flutter SDK is not in PATH. Install it, then re-run." >&2
  exit 1
fi
flutter create --platforms=android,web --project-name week_07_interactive_product_card .
flutter pub get
echo "Ready. Try: flutter analyze && flutter test && flutter run"
