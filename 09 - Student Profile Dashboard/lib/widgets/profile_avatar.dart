import 'package:flutter/material.dart';

/// A local bundled image, clipped to a circle (no network required).
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, this.size = 92, this.heroTag});

  final double size;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    final avatar = ClipOval(
      child: Image.asset(
        'assets/images/student_avatar.png',
        width: size,
        height: size,
        fit: BoxFit.cover,
        semanticLabel: 'Illustrated student profile portrait',
      ),
    );
    if (heroTag == null) return avatar;
    return Hero(tag: heroTag!, child: avatar);
  }
}
