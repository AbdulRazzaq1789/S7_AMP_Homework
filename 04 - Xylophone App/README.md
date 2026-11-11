# Week 04 — Xylophone App

A standalone, responsive Flutter xylophone built for Advanced Mobile Programming.

## Features

- Tap any of **seven colored bars** to play C4, D4, E4, F4, G4, A4, or B4.
- Uses **seven original, locally generated xylophone-like WAV files** — sound works offline.
- Each note has visual press feedback; last-played note glows.
- Play the ascending C-major scale automatically (or stop the demonstration).
- Mute/unmute, recent-note history, and a clear button.
- Supports phone and wide-screen layouts.

## Project layout

```text
lib/
  main.dart                 App entry point
  app.dart                  MaterialApp
  controllers/              Screen state and interaction logic
  data/                     Notes C4-B4
  models/                   MusicalNote
  screens/                  Main screen
  services/                 AudioPool playback implementation
  theme/                    Shared color & typography tokens
  widgets/                  Instrument, bar, controls, session panel
assets/notes/               Seven playable .wav sounds
test/                       Unit, widget, and bundled-asset tests
android/                    Android platform source and configuration
web/                        Web bootstrap, manifest, and icons
screenshots/                Instructions for capturing real evidence
```

## Getting started

Requirements: Flutter SDK (Dart included), Android SDK / Android emulator for Android, or Chrome for Web. Connection is needed only once to fetch the `audioplayers` dependency during `flutter pub get`.

### Linux/macOS

```bash
bash setup.sh
flutter analyze
flutter test
flutter run
```

### Windows PowerShell

```powershell
.\setup.ps1
flutter analyze
flutter test
flutter run
```

For a web browser, use `flutter run -d chrome`. For Android, start an emulator or connect a phone, then run `flutter devices` and `flutter run`.

### Why is setup required if Android/Web folders are already included?

The source files and native configuration are bundled; SDK-generated Gradle wrapper binaries, `.dart_tool`, `.flutter-plugins-dependencies`, `local.properties`, and other machine-specific files are intentionally excluded. `flutter create --platforms=android,web .` finishes those local native files without changing your Dart app. Avoid committing `android/local.properties` or build outputs.

## About the audio

Audio is powered by `audioplayers: ^6.4.0 (resolves a compatible 6.x release)`. Each note has a small preloaded pool. This allows overlapping notes and avoids requiring network access while playing. Sample files are original synthesized PCM WAV sounds rather than recordings of a copyrighted melody.

Web browsers generally require a user gesture before playback; tap a colored bar to start. If sound is muted on the phone, unmute the device and the in-app mute switch. Some browser policies behave differently in private mode or background tabs.

## Tests

- `controller_test.dart` checks readiness, note playback, mute, and history.
- `xylophone_widget_test.dart` checks rendered bars and user interaction with fake audio.
- `asset_test.dart` confirms each registered WAV has a valid RIFF header.

## Submission guidance

Run on a phone/emulator, then capture real screenshots showing the instrument and a played note. Submit the complete project directory or ZIP plus screenshots as requested by your instructor.

## Verification note

The project was generated and statically checked in an environment without the Flutter SDK. A successful local `flutter analyze` / `flutter test` / `flutter run` is still required before submission.
