import 'package:flutter/material.dart';

import '../models/student.dart';
import '../theme/app_palette.dart';

/// StatelessWidget: displays immutable student data and receives an action callback.
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.student,
    required this.isSaved,
    required this.onSaveToggle,
  });
  final Student student;
  final bool isSaved;
  final VoidCallback onSaveToggle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final wide = constraints.maxWidth >= 650;
      final avatar = Container(
        width: wide ? 140 : 104,
        height: wide ? 140 : 104,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withValues(alpha: 0.6), width: 4),
          image: const DecorationImage(
            image: AssetImage('assets/images/student_avatar.png'),
            fit: BoxFit.cover,
          ),
        ),
      );
      final details = Column(
        crossAxisAlignment: wide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Text('STUDENT PROFILE', style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Colors.white.withValues(alpha: 0.78),
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
          )),
          const SizedBox(height: 9),
          Text(student.name, textAlign: wide ? TextAlign.start : TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900,
            )),
          const SizedBox(height: 5),
          Text(student.department, textAlign: wide ? TextAlign.start : TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.87),
            )),
          const SizedBox(height: 13),
          Wrap(
            alignment: wide ? WrapAlignment.start : WrapAlignment.center,
            spacing: 8, runSpacing: 8,
            children: [
              _Pill(label: 'Semester ${student.semester}', icon: Icons.school_outlined),
              _Pill(label: student.studentId, icon: Icons.badge_outlined),
            ],
          ),
          const SizedBox(height: 19),
          FilledButton.icon(
            key: const Key('save_profile_button'),
            onPressed: onSaveToggle,
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppPalette.deep,
            ),
            icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_outline),
            label: Text(isSaved ? 'Saved profile' : 'Save profile'),
          ),
        ],
      );
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [AppPalette.deep, AppPalette.brand, AppPalette.sky],
          ),
        ),
        child: wide
          ? Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              avatar, const SizedBox(width: 28), Expanded(child: details),
            ])
          : Column(children: [avatar, const SizedBox(height: 20), details]),
      );
    });
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label, required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.white.withValues(alpha: 0.24)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, color: Colors.white, size: 16),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      ]),
    );
  }
}
