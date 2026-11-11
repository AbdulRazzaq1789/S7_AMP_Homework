# Android runner

The Android directory contains app Gradle build files, manifests, application label, Kotlin MainActivity and launcher resources. Gradle's SDK-generated wrappers and `local.properties` are machine-specific.

When necessary, complete the local Flutter runner using:

```bash
flutter create --platforms=android --project-name week_09_student_profile_dashboard .
```

Then `flutter pub get` and `flutter run -d <android-device>`.
