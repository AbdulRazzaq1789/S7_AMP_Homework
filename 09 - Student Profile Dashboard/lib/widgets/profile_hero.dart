import 'package:flutter/material.dart';
import '../models/student_profile.dart';
import '../theme/app_theme.dart';
import 'profile_avatar.dart';

/// Gradient banner with circular portrait and a Stack/Positioned status badge.
class ProfileHero extends StatelessWidget {
  const ProfileHero({super.key, required this.student, required this.onOpenDetails});

  final StudentProfile student;
  final VoidCallback onOpenDetails;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final small = MediaQuery.sizeOf(context).width < 390;
    const white = Colors.white;
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: dark
              ? const [Color(0xFF3D318F), Color(0xFF1C5579)]
              : const [AppTheme.indigo, Color(0xFF6C76D7), Color(0xFF478BCA)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -50,
            top: -90,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: white.withValues(alpha: .13), width: 36),
              ),
            ),
          ),
          Positioned(
            right: -28,
            bottom: -95,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: white.withValues(alpha: .07),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(small ? 19 : 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('STUDENT PROFILE',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: white.withValues(alpha: .9),
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.8,
                    )),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: ProfileAvatar(
                              size: small ? 70 : 86, heroTag: 'student-avatar'),
                        ),
                        Positioned(
                          right: -16,
                          bottom: -8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 9, vertical: 5),
                            decoration: BoxDecoration(
                              color: const Color(0xFF096F59),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: white, width: 2),
                            ),
                            child: const Text('Active',
                                style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 10)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 22),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(student.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(
                                    color: white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: small ? 21 : 27,
                                  )),
                          const SizedBox(height: 5),
                          Text(student.department,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: white.withValues(alpha: .92))),
                          const SizedBox(height: 5),
                          Text('ID: ${student.studentId}',
                              style: Theme.of(context).textTheme.labelMedium
                                  ?.copyWith(color: white.withValues(alpha: .80))),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 27),
                Wrap(
                  spacing: 9,
                  runSpacing: 9,
                  children: [
                    _HeroTag(label: 'Semester ${student.semester}'),
                    _HeroTag(label: '${student.gpa.toStringAsFixed(2)} GPA'),
                    const _HeroTag(label: 'Undergraduate'),
                  ],
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  key: const Key('open-profile-details'),
                  onPressed: onOpenDetails,
                  icon: const Icon(Icons.arrow_outward_rounded, size: 18),
                  label: const Text('View full profile'),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF34317B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroTag extends StatelessWidget {
  const _HeroTag({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: .14),
          border: Border.all(color: Colors.white.withValues(alpha: .23)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            )),
      );
}
