# Week 07 — Interactive Product Card

**Advanced Mobile Programming · Lecture 07: Responding to Gestures**

An independent Flutter homework application demonstrating the five gestures requested by the lecture: **tap, double tap, long press, horizontal swipe, and pinch/zoom**. Product data and the original headphone artwork are bundled locally; no API, log-in, third-party package, or network access is required.

## Getting started

Requires a recent Flutter SDK (Flutter 3.27+ recommended, Dart 3.4+), and either an Android emulator/phone or a browser with Flutter web support.

```bash
# First time after extracting the ZIP:
bash setup.sh                         # Linux / macOS
# or: .\setup.ps1                   # Windows PowerShell

flutter analyze
flutter test
flutter run                           # Pick a device
# or flutter run -d chrome
```

`android/` and `web/` contain their human-authored source and app icon files, but the Flutter SDK must generate native build wrappers, plugin metadata, and machine-specific settings before the first launch. If you don't want to use the script, run the equivalent commands manually from this directory:

```bash
flutter create --platforms=android,web --project-name week_07_interactive_product_card .
flutter pub get
```

## How to demonstrate every requirement

1. **Single tap** the product card (away from its buttons): show/hide the expandable description. `GestureDetector.onTap`.
2. **Double tap** the card: toggle the favorite heart and see its animated state. `GestureDetector.onDoubleTap`.
3. **Long press** the card: open a bottom-sheet action menu with Save for later and Archive. `GestureDetector.onLongPress`.
4. **Horizontal left swipe** the card: drag a full **110 logical pixels** or more to archive; shorter/rightward drags snap back. Undo from the floating SnackBar or the Restore product button. `onHorizontalDragStart`, `onHorizontalDragUpdate`, `onHorizontalDragEnd`.
5. **Pinch/zoom** the image: tap the visible **ZOOM** button, then use two fingers to zoom the picture between 1× and 4× in a dedicated `InteractiveViewer`. The gesture counts as completed only after an actual two-finger enlargement. Desktop trackpad gesture zoom is supported.
6. **Visible standard action:** the **Add to bag** `FilledButton` increments the bag count. It remains available without special gestures.
7. **Visual feedback:** the gesture checklist, favorite heart, expanding description, drag reveal, toast-like SnackBar with Undo, and last-activity message all reflect interaction state.

**Why zoom uses a dialog:** Separating the `InteractiveViewer` from the swipe surface prevents the horizontal-drag and scale recognizers from competing for the same touch sequence. This keeps both interactions reliable while still requiring an actual pinch gesture.

## Project structure

```text
Week_07_Interactive_Product_Card/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   ├── controllers/product_demo_controller.dart
│   ├── data/sample_product.dart
│   ├── models/product.dart
│   ├── theme/app_theme.dart
│   ├── screens/gesture_lab_screen.dart
│   └── widgets/
│       ├── product_gesture_card.dart
│       ├── product_image.dart
│       ├── image_zoom_dialog.dart
│       ├── product_actions_sheet.dart
│       ├── gesture_guide.dart
│       ├── archive_placeholder.dart
│       └── label_pill.dart
├── assets/images/headphones.png
├── android/
├── web/
├── test/
│   ├── product_demo_controller_test.dart
│   └── gesture_lab_widget_test.dart
├── screenshots/README.md
├── ASSIGNMENT_CHECKLIST.md
├── analysis_options.yaml
├── pubspec.yaml
├── setup.sh
└── setup.ps1
```

## Screenshots required by the lecturer

The slide says to submit **source code, screenshots and a short explanation of each gesture**. Please run the app and capture real emulator/device screenshots for:

- Initial product card and gesture checklist
- Expanded description after single tap
- Favorited heart after double tap
- Open action menu following a long press
- Archived state and Undo (or restored state)
- Zoomed image in the full-size viewer
- Bag count after pressing Add to bag

Save your actual screenshots in `screenshots/` (instructions provided). The ZIP intentionally does **not** claim unexecuted screenshots as real.

## Important technical notes

- `ProductDemoController` stores temporary state in memory; its data resets when the app restarts.
- Product names and prices are fictional. There are no purchases and the bag action is simulated.
- Long-press menu and visible button remain accessible even when users don't complete other gestures.
- `ProductGestureCard` owns horizontal drag preview and 110 px threshold; `ProductDemoController` owns archive and Undo state.
- `ImageZoomDialog` disposes its `TransformationController`; the screen disposes the product state controller.
- `flutter analyze` and `flutter test` commands are included, but **Flutter isn't installed in the environment that packaged this ZIP**. Structural and static file checks are performed; compilation and emulator behavior must be verified on your machine.
