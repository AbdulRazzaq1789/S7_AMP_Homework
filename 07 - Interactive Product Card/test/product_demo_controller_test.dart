import 'package:flutter_test/flutter_test.dart';
import 'package:week_07_interactive_product_card/controllers/product_demo_controller.dart';

void main() {
  group('ProductDemoController', () {
    late ProductDemoController controller;

    setUp(() => controller = ProductDemoController());
    tearDown(() => controller.dispose());

    test('starts with a visible product and no completed gestures', () {
      expect(controller.isArchived, isFalse);
      expect(controller.isFavorite, isFalse);
      expect(controller.detailsVisible, isFalse);
      expect(controller.completedCount, 0);
    });

    test('single tap toggles details and is counted only once', () {
      controller.toggleDetails();
      expect(controller.detailsVisible, isTrue);
      expect(controller.completedGestures.contains(DemoGesture.tap), isTrue);
      controller.toggleDetails();
      expect(controller.detailsVisible, isFalse);
      expect(controller.completedCount, 1);
    });

    test('double tap toggles favorite', () {
      controller.toggleFavorite();
      expect(controller.isFavorite, isTrue);
      controller.toggleFavorite();
      expect(controller.isFavorite, isFalse);
      expect(controller.completedGestures.contains(DemoGesture.doubleTap), isTrue);
    });

    test('long press records action-menu interaction', () {
      controller.openActionMenu();
      expect(controller.completedGestures.contains(DemoGesture.longPress), isTrue);
    });

    test('archiving hides gestures until Undo restores the product', () {
      controller.archive();
      expect(controller.isArchived, isTrue);
      controller.toggleFavorite();
      expect(controller.isFavorite, isFalse);
      controller.undoArchive();
      expect(controller.isArchived, isFalse);
      expect(controller.completedGestures.contains(DemoGesture.swipe), isTrue);
    });

    test('pinch is recorded once; bag and saved state change independently', () {
      controller.recordPinch();
      controller.recordPinch();
      controller.addToBag();
      controller.toggleSaved();
      expect(controller.completedCount, 1);
      expect(controller.bagCount, 1);
      expect(controller.isSaved, isTrue);
    });
  });
}
