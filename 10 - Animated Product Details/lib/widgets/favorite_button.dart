import 'package:flutter/material.dart';

/// Explicit animation: AnimationController + Tween + CurvedAnimation + AnimatedBuilder.
class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 240),
    );
    _scale = Tween<double>(begin: 1.0, end: 1.28).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
  }

  void _toggle() {
    setState(() => _isFavorite = !_isFavorite);
    _controller.forward(from: 0).then((_) {
      if (mounted) _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _scale,
        builder: (context, child) => Transform.scale(
          scale: _scale.value,
          child: child,
        ),
        child: IconButton.filledTonal(
          key: const Key('favorite_button'),
          tooltip: _isFavorite ? 'Remove favorite' : 'Add favorite',
          onPressed: _toggle,
          icon: Icon(_isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              color: _isFavorite ? Colors.pink : Theme.of(context).colorScheme.primary),
        ),
      );
}
