# Week 10 — Animated Product Details

**Advanced Mobile Programming · Lecture 10 homework**

An independent Flutter app that opens a product detail screen from a product list and demonstrates implicit, explicit and staggered animations. Includes bundled product images; no network access or extra packages are needed for app functionality.

## Get started

1. Install Flutter (Dart SDK comes with Flutter), Android Studio/Android SDK if targeting Android, or Chrome if targeting web.
2. Open this project folder (`Week_10_Animated_Product_Details`) directly in VS Code or Android Studio.
3. In a terminal at this folder, run:

```bash
flutter pub get
flutter run
```

To run in Chrome: `flutter run -d chrome`.

**Native projects:** Android and web launchers are included. If your local Flutter SDK requires newer generated platform scaffolding, run `flutter create --platforms=android,web .` in this folder, then `flutter pub get`. This preserves the Dart source and bundled assets. To additionally enable iOS, macOS, Linux or Windows on a supported host, run `flutter create --platforms=ios,macos,linux,windows .` (select only platforms installed/supported on your computer).

## Required features mapped to files

| Lecture requirement | Where implemented |
|---|---|
| Animated Product Details screen | `lib/screens/animated_product_details.dart` |
| AnimatedContainer expands specifications | `lib/widgets/specifications_panel.dart` (also uses AnimatedSize) |
| AnimatedOpacity additional information | `lib/widgets/additional_information.dart` |
| Favorite icon AnimationController + Tween | `lib/widgets/favorite_button.dart` |
| CurvedAnimation | `lib/widgets/favorite_button.dart` and `lib/widgets/staggered_entrance.dart` |
| AnimatedBuilder or Transition widget | `lib/widgets/favorite_button.dart` (AnimatedBuilder); also FadeTransition/SlideTransition |
| Stagger image → title → price → button | `lib/widgets/staggered_entrance.dart` and detail screen intervals |
| Navigation from product list | `lib/screens/product_list_screen.dart` |
| Optional Hero animation | `lib/widgets/product_image.dart` |
| Dispose controllers | `dispose()` in favorite button and details screen |
| Source, screenshots, animation timeline explanation | Source provided, timeline below; you capture screenshots after running the app |

## Animation timeline

Total entrance duration: **1300 ms**. Each element fades in and slides upward with an ease-out cubic curve. Times overlap intentionally.

| Element | Interval | Approx. active time |
|---|---|---|
| Product image | 0.00–0.35 | 0–455 ms |
| Title/description | 0.16–0.52 | 208–676 ms |
| Price/availability | 0.32–0.70 | 416–910 ms |
| Add-to-cart button | 0.60–1.00 | 780–1300 ms |

Other durations: specifications 340 ms; additional information fade 300 ms and size 370 ms; favorite scale pulse 240 ms forward and 240 ms reverse. Favorite uses `Tween<double>(1.0 → 1.28)` with `CurvedAnimation(Curves.easeOutBack)` and `AnimatedBuilder`. Two `AnimationController` instances are independently disposed when their widgets leave the tree.

## Test and validation

```bash
flutter analyze
flutter test
flutter run
```

Suggested screenshots: (1) product list, (2) product details, (3) expanded specifications, (4) visible additional information and favorite active. A short screen recording is useful for animations because still images cannot demonstrate motion.

**Verification status:** The archive was checked structurally and its files were cross-referenced. Flutter SDK is not available in the creation environment, so `flutter analyze`, `flutter test`, native compilation and on-device screenshots have **not** been run here.
