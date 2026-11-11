# Lecture 07 homework — requirement coverage

Source: *Advanced Mobile Programming — Lecture 07: Responding to Gestures*, homework slide, PDF page 67 (slide footer shows 68).

| Lecturer requirement | Implementation |
| --- | --- |
| Build an `Interactive Product Card` screen | `lib/screens/gesture_lab_screen.dart`, `widgets/product_gesture_card.dart` |
| Tap toggles product details | `GestureDetector.onTap`, `ProductDemoController.toggleDetails`, `AnimatedSize` |
| Double tap toggles favorite | `GestureDetector.onDoubleTap`, `ProductDemoController.toggleFavorite`, `AnimatedScale` |
| Long press opens action menu | `onLongPress`, `showModalBottomSheet`, `widgets/product_actions_sheet.dart` |
| Horizontal swipe simulates archive | Horizontal drag callbacks in `product_gesture_card.dart`; in-memory `archive` state |
| Safe threshold + Undo | 110 logical px threshold, short swipe returns, `SnackBarAction('UNDO')`, Restore button |
| Zoomable product image | `widgets/image_zoom_dialog.dart` with `InteractiveViewer` (1× to 4×) |
| Visual feedback | Progress checklist, animated favorite, animated details, swipe reveal, last-action panel and SnackBars |
| Standard visible button for essential action | `FilledButton.icon` labeled **Add to bag** |
| Submit source, screenshots, short explanation | Source in `lib/`; capture screenshots after running; explanation below and in README |

## Short explanation of every gesture

**Tap:** `GestureDetector.onTap` changes a boolean in the controller. `AnimatedSize` expands/collapses the product description. This gesture is intended for viewing details without navigating away.

**Double tap:** `onDoubleTap` flips the favorite state. The heart icon switches between outlined and filled and `AnimatedScale` briefly enlarges the filled state. Flutter's gesture recognition distinguishes a double tap from a single tap.

**Long press:** Holding the card calls `showModalBottomSheet`. The menu offers Save for later and Archive. This exposes secondary actions without permanently occupying screen space.

**Horizontal drag/swipe:** `onHorizontalDragUpdate` tracks displacement, moving the card left to reveal a red Archive surface. Archiving only happens after at least 110 logical pixels of left movement when the gesture ends. Any smaller or rightward movement snaps back. A SnackBar with Undo and a Restore product button reverse the action.

**Pinch/zoom:** The image opens in a zoom dialog using `InteractiveViewer`, which responds to two-finger scaling or a supported trackpad. Its `TransformationController` tracks scale from 1× to 4×. The completed-gesture marker updates when the user actually enlarges the image with two fingers. Keeping the zoom interaction in a separate dialog prevents interference with the card's horizontal swipe recognizer.

**Additional conventional action:** A visible `FilledButton` adds to a simulated shopping bag. This ensures an essential action does not depend only on hidden gestures.

## Instructor submission

- Flutter project source ZIP
- Real screenshots from at least one running emulator/device
- The short gesture explanations above

The assignment slide does not request authentication, a backend, or persistence, and none is added.
