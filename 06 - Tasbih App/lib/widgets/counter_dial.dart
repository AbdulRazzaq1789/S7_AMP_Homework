import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// A large accessible tap target with an animated progress ring.
class CounterDial extends StatefulWidget {
  const CounterDial({
    super.key,
    required this.count,
    required this.goal,
    required this.phrase,
    required this.onTap,
  });

  final int count;
  final int goal;
  final String phrase;
  final VoidCallback onTap;

  @override
  State<CounterDial> createState() => _CounterDialState();
}

class _CounterDialState extends State<CounterDial> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final complete = widget.count == widget.goal;
    final size = math.min(MediaQuery.sizeOf(context).width - 92, 278.0);
    return Center(
      child: Semantics(
        label: 'Tasbih counter, ${widget.phrase}, ${widget.count} of ${widget.goal}. Tap to count.',
        button: true,
        child: AnimatedScale(
          scale: pressed ? 0.97 : 1,
          duration: const Duration(milliseconds: 120),
          child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: size,
                  height: size,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: widget.count / widget.goal),
                    duration: const Duration(milliseconds: 260),
                    curve: Curves.easeOutCubic,
                    builder: (context, progress, _) => CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 10,
                      strokeCap: StrokeCap.round,
                      backgroundColor: AppPalette.mint,
                      color: complete ? AppPalette.gold : AppPalette.jade,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(17),
                  child: Material(
                    color: AppPalette.pine,
                    shape: const CircleBorder(),
                    elevation: 10,
                    shadowColor: AppPalette.pine.withValues(alpha: 0.20),
                    child: InkWell(
                      key: const Key('counter_button'),
                      customBorder: const CircleBorder(),
                      onTap: widget.onTap,
                      onTapDown: (_) => setState(() => pressed = true),
                      onTapCancel: () => setState(() => pressed = false),
                      onTapUp: (_) => setState(() => pressed = false),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [Color(0xFF17735F), AppPalette.deepPine],
                            radius: 1,
                            center: Alignment(-0.35, -0.45),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${widget.count}',
                                key: const Key('counter_value'),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size < 230 ? 54 : 70,
                                  fontWeight: FontWeight.w800,
                                  height: 1,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                complete ? 'TARGET REACHED' : 'TAP TO COUNT',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.7,
                                  color: complete ? AppPalette.gold : const Color(0xFFD2E6DA),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
