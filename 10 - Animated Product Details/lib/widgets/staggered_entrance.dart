import 'package:flutter/material.dart';

/// Fade and vertical movement during an interval of the overall timeline.
class StaggeredEntrance extends StatelessWidget {
  const StaggeredEntrance({super.key, required this.controller,
      required this.begin, required this.end, required this.child});
  final AnimationController controller;
  final double begin;
  final double end;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final curve = CurvedAnimation(
      parent: controller,
      curve: Interval(begin, end, curve: Curves.easeOutCubic),
    );
    return FadeTransition(
      opacity: curve,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.15), end: Offset.zero,
        ).animate(curve),
        child: child,
      ),
    );
  }
}
