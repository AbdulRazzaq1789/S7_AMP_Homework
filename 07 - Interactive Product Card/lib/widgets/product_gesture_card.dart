import 'package:flutter/material.dart';

import '../models/product.dart';
import '../theme/app_theme.dart';
import 'label_pill.dart';
import 'product_image.dart';

/// The interactive gesture surface and animated swipe-to-archive affordance.
/// An archive requires at least 110 logical pixels of leftward movement.
class ProductGestureCard extends StatefulWidget {
  const ProductGestureCard({
    super.key,
    required this.product,
    required this.detailsVisible,
    required this.favorite,
    required this.bagCount,
    required this.onTap,
    required this.onDoubleTap,
    required this.onLongPress,
    required this.onArchive,
    required this.onAddToBag,
    required this.onZoom,
  });

  final Product product;
  final bool detailsVisible;
  final bool favorite;
  final int bagCount;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;
  final VoidCallback onLongPress;
  final VoidCallback onArchive;
  final VoidCallback onAddToBag;
  final VoidCallback onZoom;

  @override
  State<ProductGestureCard> createState() => _ProductGestureCardState();
}

class _ProductGestureCardState extends State<ProductGestureCard> {
  static const double _archiveThreshold = 110;
  double _dragDx = 0;
  bool _dragging = false;

  void _beginDrag(DragStartDetails details) {
    setState(() {
      _dragging = true;
      _dragDx = 0;
    });
  }

  void _updateDrag(DragUpdateDetails details) {
    setState(() {
      _dragDx = (_dragDx + details.delta.dx).clamp(-185.0, 40.0);
    });
  }

  void _finishDrag(DragEndDetails details) {
    final bool shouldArchive = _dragDx <= -_archiveThreshold;
    setState(() {
      _dragging = false;
      _dragDx = 0;
    });
    if (shouldArchive) widget.onArchive();
  }

  void _cancelDrag() {
    setState(() {
      _dragging = false;
      _dragDx = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Product product = widget.product;
    return Semantics(
      label: 'Interactive product card. Tap for details, double tap for '
          'favorite, long press for options or swipe left to archive.',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Stack(
          children: [
            const Positioned.fill(child: ColoredBox(color: AppPalette.danger)),
            const Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inventory_2_outlined,
                          color: Colors.white, size: 31),
                      SizedBox(height: 8),
                      Text('ARCHIVE', style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 11,
                        letterSpacing: .7,
                      )),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: _dragging
                  ? Duration.zero
                  : const Duration(milliseconds: 240),
              curve: Curves.easeOutCubic,
              transform: Matrix4.translationValues(_dragDx, 0, 0),
              child: GestureDetector(
                key: const Key('gesture_surface'),
                behavior: HitTestBehavior.opaque,
                onTap: widget.onTap,
                onDoubleTap: widget.onDoubleTap,
                onLongPress: widget.onLongPress,
                onHorizontalDragStart: _beginDrag,
                onHorizontalDragUpdate: _updateDrag,
                onHorizontalDragEnd: _finishDrag,
                onHorizontalDragCancel: _cancelDrag,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppPalette.white,
                    borderRadius: BorderRadius.circular(AppRadius.card),
                    border: Border.all(color: AppPalette.border),
                  ),
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductImage(
                        assetPath: product.assetPath,
                        onOpenViewer: widget.onZoom,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 24, 8, 9),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    product.category,
                                    style: const TextStyle(
                                      color: AppPalette.green,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ),
                                const Icon(Icons.star_rounded,
                                    color: Color(0xFFE5A641), size: 17),
                                const SizedBox(width: 3),
                                Text(
                                  '${product.rating} (${product.reviews})',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(product.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      height: 1.1,
                                      letterSpacing: -.9,
                                      fontSize: 31,
                                    ),
                                  ),
                                ),
                                AnimatedScale(
                                  scale: widget.favorite ? 1.14 : 1,
                                  duration: const Duration(milliseconds: 220),
                                  curve: Curves.easeOutBack,
                                  child: Container(
                                    width: 43, height: 43,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppPalette.paleGreen,
                                    ),
                                    child: Icon(
                                      widget.favorite
                                          ? Icons.favorite_rounded
                                          : Icons.favorite_border_rounded,
                                      key: const Key('favorite_indicator'),
                                      color: widget.favorite
                                          ? AppPalette.danger
                                          : AppPalette.green,
                                      size: 23,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              product.tagline,
                              style: const TextStyle(
                                color: AppPalette.muted,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 17),
                            Wrap(
                              spacing: 8,
                              runSpacing: 7,
                              children: [
                                for (final feature in product.features)
                                  LabelPill(label: feature),
                              ],
                            ),
                            AnimatedSize(
                              alignment: Alignment.topCenter,
                              curve: Curves.easeOutCubic,
                              duration: const Duration(milliseconds: 260),
                              child: widget.detailsVisible
                                  ? Padding(
                                      key: const Key('product_details'),
                                      padding: const EdgeInsets.only(top: 18),
                                      child: Text(product.description,
                                        style: const TextStyle(
                                          color: AppPalette.muted,
                                          fontSize: 14,
                                          height: 1.55,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            const SizedBox(height: 18),
                            const Divider(height: 1, color: AppPalette.border),
                            const SizedBox(height: 19),
                            Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('SPECIAL PRICE',
                                      style: TextStyle(
                                        color: AppPalette.muted,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: .9,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text('\$${product.price.toStringAsFixed(0)}',
                                          style: const TextStyle(
                                            fontSize: 29,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: -.7,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text('\$${product.previousPrice.toStringAsFixed(0)}',
                                          style: const TextStyle(
                                            color: AppPalette.muted,
                                            fontSize: 13,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                FilledButton.icon(
                                  key: const Key('add_to_bag'),
                                  onPressed: widget.onAddToBag,
                                  icon: const Icon(Icons.shopping_bag_outlined, size: 19),
                                  label: Text(widget.bagCount == 0
                                      ? 'Add to bag'
                                      : 'Add again'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
