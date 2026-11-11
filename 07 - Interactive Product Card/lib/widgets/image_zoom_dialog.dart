import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Isolated pinch-to-zoom canvas. Keeping it separate avoids GestureArena
/// conflicts between horizontal card swipes and scale gestures on the image.
class ImageZoomDialog extends StatefulWidget {
  const ImageZoomDialog({
    super.key,
    required this.assetPath,
    required this.onPinchDetected,
  });

  final String assetPath;
  final VoidCallback onPinchDetected;

  @override
  State<ImageZoomDialog> createState() => _ImageZoomDialogState();
}

class _ImageZoomDialogState extends State<ImageZoomDialog> {
  final TransformationController _transform = TransformationController();
  bool _pinchRecorded = false;

  void _handleZoom(ScaleUpdateDetails details) {
    if (_pinchRecorded) return;
    if (details.pointerCount >= 2 &&
        _transform.value.getMaxScaleOnAxis() > 1.04) {
      _pinchRecorded = true;
      widget.onPinchDetected();
    }
  }

  void _reset() {
    _transform.value = Matrix4.identity();
  }

  @override
  void dispose() {
    _transform.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size viewport = MediaQuery.sizeOf(context);
    final double maxWidth = viewport.width > 792 ? 760 : viewport.width - 32;
    final double maxHeight = viewport.height > 780 ? 720 : viewport.height - 60;
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: maxHeight,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Expanded(child: Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Text('Explore the details', style: TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w900)),
                  )),
                  IconButton(
                    key: const Key('close_image_viewer'),
                    tooltip: 'Close image viewer',
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Flexible(
                child: AspectRatio(
                  aspectRatio: 1.05,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: ColoredBox(
                      color: const Color(0xFFDAEAE2),
                      child: InteractiveViewer(
                        key: const Key('pinch_image_viewer'),
                        transformationController: _transform,
                        minScale: 1,
                        maxScale: 4,
                        panEnabled: true,
                        scaleEnabled: true,
                        trackpadScrollCausesScale: true,
                        onInteractionUpdate: _handleZoom,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.asset(widget.assetPath,
                            fit: BoxFit.contain,
                            semanticLabel: 'Zoomable product image'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Expanded(
                    child: Text('Pinch with two fingers, or use the trackpad to zoom.',
                      style: TextStyle(color: AppPalette.muted, fontSize: 12)),
                  ),
                  const SizedBox(width: 6),
                  TextButton.icon(
                    key: const Key('reset_image_zoom'),
                    onPressed: _reset,
                    icon: const Icon(Icons.restart_alt_rounded, size: 18),
                    label: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
