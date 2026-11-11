import 'package:flutter/material.dart';

import '../controllers/product_demo_controller.dart';
import '../data/sample_product.dart';
import '../theme/app_theme.dart';
import '../widgets/archive_placeholder.dart';
import '../widgets/gesture_guide.dart';
import '../widgets/image_zoom_dialog.dart';
import '../widgets/label_pill.dart';
import '../widgets/product_actions_sheet.dart';
import '../widgets/product_gesture_card.dart';

class GestureLabScreen extends StatefulWidget {
  const GestureLabScreen({super.key});

  @override
  State<GestureLabScreen> createState() => _GestureLabScreenState();
}

class _GestureLabScreenState extends State<GestureLabScreen> {
  late final ProductDemoController _demo = ProductDemoController();

  void _archiveProduct() {
    _demo.archive();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: const Text('Product archived.'),
        duration: const Duration(seconds: 6),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: _demo.undoArchive,
        ),
      ));
  }

  Future<void> _showActions() async {
    _demo.openActionMenu();
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (sheetContext) => ProductActionsSheet(
        isSaved: _demo.isSaved,
        onSave: () {
          Navigator.of(sheetContext).pop();
          _demo.toggleSaved();
        },
        onArchive: () {
          Navigator.of(sheetContext).pop();
          _archiveProduct();
        },
      ),
    );
  }

  Future<void> _showImageViewer() async {
    await showDialog<void>(
      context: context,
      builder: (_) => ImageZoomDialog(
        assetPath: sampleProduct.assetPath,
        onPinchDetected: _demo.recordPinch,
      ),
    );
  }

  void _addToBag() {
    _demo.addToBag();
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(
        content: Text('Added to your demo bag.'),
        duration: Duration(seconds: 2),
      ));
  }

  @override
  void dispose() {
    _demo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _demo,
          builder: (context, _) => CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _Header(bagCount: _demo.bagCount)),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(18, 12, 18, 35),
                sliver: SliverToBoxAdapter(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1110),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _PageIntro(),
                          const SizedBox(height: 24),
                          LayoutBuilder(builder: (context, constraints) {
                            final bool sideBySide = constraints.maxWidth >= 880;
                            final Widget productView = AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              switchInCurve: Curves.easeOutCubic,
                              switchOutCurve: Curves.easeInCubic,
                              child: _demo.isArchived
                                  ? ArchivePlaceholder(
                                      key: const ValueKey('archived'),
                                      onRestore: _demo.undoArchive,
                                    )
                                  : ProductGestureCard(
                                      key: const ValueKey('product'),
                                      product: sampleProduct,
                                      detailsVisible: _demo.detailsVisible,
                                      favorite: _demo.isFavorite,
                                      bagCount: _demo.bagCount,
                                      onTap: _demo.toggleDetails,
                                      onDoubleTap: _demo.toggleFavorite,
                                      onLongPress: _showActions,
                                      onArchive: _archiveProduct,
                                      onAddToBag: _addToBag,
                                      onZoom: _showImageViewer,
                                    ),
                            );
                            final Widget guideView = Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                GestureGuide(
                                  completed: _demo.completedGestures,
                                  lastActivity: _demo.lastActivity,
                                ),
                                const SizedBox(height: 16),
                                const _TipsPanel(),
                              ],
                            );
                            if (!sideBySide) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  productView,
                                  const SizedBox(height: 19),
                                  guideView,
                                ],
                              );
                            }
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(flex: 11, child: productView),
                                const SizedBox(width: 23),
                                Expanded(flex: 9, child: guideView),
                              ],
                            );
                          }),
                          const SizedBox(height: 25),
                          const _Footer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.bagCount});
  final int bagCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      child: Center(child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1110),
        child: Row(
          children: [
            Container(
              width: 44, height: 44,
              decoration: BoxDecoration(
                color: AppPalette.ink,
                borderRadius: BorderRadius.circular(AppRadius.small),
              ),
              child: const Icon(Icons.gesture_rounded, color: Colors.white),
            ),
            const SizedBox(width: 12),
            const Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('GESTURE LAB', style: TextStyle(
                  color: AppPalette.ink,
                  fontSize: 16,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w900,
                )),
                SizedBox(height: 2),
                Text('ADVANCED MOBILE PROGRAMMING / 07',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppPalette.muted,
                    fontSize: 9.5,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .7,
                  )),
              ],
            )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: AppPalette.white,
                borderRadius: BorderRadius.circular(AppRadius.small),
                border: Border.all(color: AppPalette.border),
              ),
              child: Row(
                children: [
                  const Icon(Icons.shopping_bag_outlined,
                    color: AppPalette.ink, size: 19),
                  const SizedBox(width: 7),
                  Text('$bagCount', key: const Key('bag_count'),
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                    )),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class _PageIntro extends StatelessWidget {
  const _PageIntro();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelPill(
          label: 'LESSON 07 · HANDS-ON PROJECT',
          icon: Icons.circle_rounded,
          background: AppPalette.paleSand,
          foreground: AppPalette.ink,
        ),
        SizedBox(height: 14),
        Text('Make every gesture count.',
          style: TextStyle(fontSize: 31, height: 1.12,
            fontWeight: FontWeight.w900, letterSpacing: -1.1)),
        SizedBox(height: 9),
        Text(
          'One product. Five intuitive interactions. Explore the card '
          'and watch your progress update as you go.',
          style: TextStyle(color: AppPalette.muted, height: 1.5,
            fontSize: 14),
        ),
      ],
    );
  }
}

class _TipsPanel extends StatelessWidget {
  const _TipsPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpace.lg),
      decoration: BoxDecoration(
        color: AppPalette.ink,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_outline_rounded,
            color: Color(0xFFB6E9D6), size: 27),
          SizedBox(height: 14),
          Text('Built for intentional touches',
            style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.w900, fontSize: 17)),
          SizedBox(height: 9),
          Text(
            'A short swipe will snap back. Only a deliberate left swipe '
            'archives this demo product. You can always undo.',
            style: TextStyle(color: Color(0xFFC2CDD0),
              height: 1.5, fontSize: 13),
          ),
          SizedBox(height: 14),
          Row(children: [
            Icon(Icons.check_circle_outline_rounded,
              color: Color(0xFFB6E9D6), size: 18),
            SizedBox(width: 8),
            Expanded(child: Text('A visible Add to bag action is always available.',
              style: TextStyle(color: Color(0xFFC2CDD0),
                fontSize: 12.5, height: 1.4))),
          ]),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.code_rounded, size: 15, color: AppPalette.muted),
        SizedBox(width: 8),
        Expanded(child: Text(
          'WEEK 07 · GESTUREDETECTOR · INTERACTIVEVIEWER · MATERIAL 3',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800,
              letterSpacing: .45, color: AppPalette.muted),
        )),
      ],
    );
  }
}
