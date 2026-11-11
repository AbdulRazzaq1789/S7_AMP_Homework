import 'package:flutter/material.dart';

/// A vector die face drawn with Flutter; no image asset or plugin is required.
class DieFace extends StatelessWidget {
  const DieFace({
    required this.value,
    required this.size,
    this.pipColor = const Color(0xFF5041D1),
    super.key,
  }) : assert(value >= 1 && value <= 6);

  final int value;
  final double size;
  final Color pipColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * .18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size * .23),
        border: Border.all(color: const Color(0xFFE6E3F7), width: 1.3),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2A1A72).withAlpha(31),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: CustomPaint(
        painter: DiePipsPainter(value: value, pipColor: pipColor),
      ),
    );
  }
}

/// Coordinates are normalized to a 3×3 grid.
class DiePipsPainter extends CustomPainter {
  const DiePipsPainter({required this.value, required this.pipColor});

  final int value;
  final Color pipColor;

  static const _topLeft = Offset(.14, .14);
  static const _topRight = Offset(.86, .14);
  static const _middleLeft = Offset(.14, .50);
  static const _center = Offset(.50, .50);
  static const _middleRight = Offset(.86, .50);
  static const _bottomLeft = Offset(.14, .86);
  static const _bottomRight = Offset(.86, .86);

  static List<Offset> positionsFor(int face) => switch (face) {
        1 => [_center],
        2 => [_topLeft, _bottomRight],
        3 => [_topLeft, _center, _bottomRight],
        4 => [_topLeft, _topRight, _bottomLeft, _bottomRight],
        5 => [_topLeft, _topRight, _center, _bottomLeft, _bottomRight],
        6 => [
            _topLeft, _topRight, _middleLeft, _middleRight,
            _bottomLeft, _bottomRight,
          ],
        _ => throw ArgumentError.value(face, 'face', 'Expected 1–6'),
      };

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = pipColor;
    final radius = size.shortestSide * .10;
    for (final point in positionsFor(value)) {
      canvas.drawCircle(
        Offset(size.width * point.dx, size.height * point.dy),
        radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant DiePipsPainter oldDelegate) =>
      value != oldDelegate.value || pipColor != oldDelegate.pipColor;
}
