# Android sources

This folder contains the Android manifest, FlutterActivity embedding,
app resources and Gradle Kotlin build configuration for this project.

A Gradle wrapper JAR and `local.properties` are intentionally not bundled;
they are generated for the local Flutter/Android SDK. Complete platform
scaffolding once using:

```bash
flutter create --platforms=android,web --project-name week_04_xylophone_app .
```

Run that command from the Flutter project root, NOT from `android/`.
