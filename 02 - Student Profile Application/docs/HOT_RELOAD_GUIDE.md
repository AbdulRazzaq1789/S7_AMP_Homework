# Hot Reload demonstration — Lecture 02

**What to do:**

1. Start the app with `flutter run` (debug mode).
2. Scroll to **Hot Reload lab** and click **Increase counter** three times.
3. Open `lib/widgets/hot_reload_demo_card.dart`.
4. Change `hotReloadHeadline` from `Small changes. Big progress.` to `Hot Reload works!`.
5. Save and trigger **Hot Reload** (`r` in the Flutter terminal or IDE lightning icon).
6. Observe the changed words **and** the unchanged counter value (`Counter: 3`).
7. Take screenshots before and after, then trigger **Hot Restart** (`R` in the terminal) and observe the counter reset to `0`.

**Why:** Hot Reload re-injects updated Dart code and rebuilds the widget tree while preserving existing `State` objects when their identity remains compatible. Hot Restart starts the Dart application again and resets the in-memory state. Changing native code or app initialization may require a full restart.

This demonstration must be performed on a running Flutter application; the result cannot be captured by a static source review.
