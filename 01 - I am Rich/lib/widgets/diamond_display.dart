import 'package:flutter/material.dart';


/// A reusable image presentation widget with a real, bundled PNG asset.
class DiamondDisplay extends StatelessWidget {
  const DiamondDisplay({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [Color(0x884C8FA9), Color(0x224B3860), Colors.transparent],
            stops: [0.0, 0.54, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x1AF0CD8D),
              blurRadius: 55,
              spreadRadius: -16,
            ),
          ],
        ),
        child: Image.asset(
          'assets/images/diamond.png',
          key: const Key('diamond-image'),
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
          semanticLabel: 'A sparkling blue diamond',
        ),
      ),
    );
  }
}
