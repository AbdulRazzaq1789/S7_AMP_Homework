import 'package:flutter/foundation.dart';

/// The five gestures specifically requested on the Week 07 homework slide.
enum DemoGesture { tap, doubleTap, longPress, swipe, pinch }

/// In-memory state kept independently from UI widgets for easy unit testing.
class ProductDemoController extends ChangeNotifier {
  bool _detailsVisible = false;
  bool _favorite = false;
  bool _archived = false;
  bool _saved = false;
  int _bagCount = 0;
  String _activity = 'Try a gesture on the product card.';
  final Set<DemoGesture> _completed = <DemoGesture>{};

  bool get detailsVisible => _detailsVisible;
  bool get isFavorite => _favorite;
  bool get isArchived => _archived;
  bool get isSaved => _saved;
  int get bagCount => _bagCount;
  String get lastActivity => _activity;
  Set<DemoGesture> get completedGestures => Set<DemoGesture>.unmodifiable(_completed);
  int get completedCount => _completed.length;

  void toggleDetails() {
    if (_archived) return;
    _detailsVisible = !_detailsVisible;
    _record(DemoGesture.tap,
        _detailsVisible ? 'Details expanded with a tap.' : 'Details hidden with a tap.');
  }

  void toggleFavorite() {
    if (_archived) return;
    _favorite = !_favorite;
    _record(DemoGesture.doubleTap,
        _favorite ? 'Added to favorites by double tap.' : 'Removed from favorites by double tap.');
  }

  void openActionMenu() {
    if (_archived) return;
    _record(DemoGesture.longPress, 'Long press opened the action menu.');
  }

  void archive() {
    if (_archived) return;
    _archived = true;
    _record(DemoGesture.swipe, 'Product archived with a swipe.');
  }

  void undoArchive() {
    if (!_archived) return;
    _archived = false;
    _activity = 'Archive undone. Your product is back.';
    notifyListeners();
  }

  void recordPinch() {
    if (_completed.contains(DemoGesture.pinch)) return;
    _record(DemoGesture.pinch, 'Image zoomed with a pinch gesture.');
  }

  void toggleSaved() {
    _saved = !_saved;
    _activity = _saved ? 'Saved for later.' : 'Removed from saved items.';
    notifyListeners();
  }

  void addToBag() {
    _bagCount += 1;
    _activity = 'Added to bag. Items in bag: $_bagCount.';
    notifyListeners();
  }

  void _record(DemoGesture gesture, String text) {
    _completed.add(gesture);
    _activity = text;
    notifyListeners();
  }
}
