import 'package:flutter/material.dart';

import '../models/course.dart';
import '../theme/app_theme.dart';

/// Uses a decorated Container, rich text with multiple TextSpan styles,
/// and a responsive Row/Column composition.
class CourseHero extends StatelessWidget {
  const CourseHero({
    super.key,
    required this.course,
    required this.saved,
    required this.onSave,
    required this.onViewOutline,
  });

  final Course course;
  final bool saved;
  final VoidCallback onSave;
  final VoidCallback onViewOutline;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(26, 28, 26, 28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[AppPalette.navy, Color(0xFF214D83)],
        ),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Stack(
        children: <Widget>[
          const Positioned(
            right: -18,
            top: -48,
            child: IgnorePointer(
              child: Icon(Icons.auto_awesome_mosaic_rounded,
                  size: 168, color: Color(0x16FFFFFF)),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: const Color(0x20FFFFFF),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0x38FFFFFF)),
                ),
                child: const Text('COURSE INFORMATION',
                    style: TextStyle(color: AppPalette.aqua,
                        fontSize: 11, fontWeight: FontWeight.w800,
                        letterSpacing: 1.4)),
              ),
              const SizedBox(height: 22),
              Text(
                course.title,
                style: const TextStyle(
                  fontSize: 32,
                  height: 1.18,
                  letterSpacing: -0.8,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 11),
              Text(course.department,
                  style: const TextStyle(color: Color(0xFFCBDAED),
                      fontSize: 15, height: 1.4)),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 13, height: 1.6),
                  children: <InlineSpan>[
                    const TextSpan(text: 'COURSE CODE  ', style: TextStyle(
                      color: Color(0xFFABC1DD), fontWeight: FontWeight.w600,
                      letterSpacing: 0.7,
                    )),
                    TextSpan(text: course.code, style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800,
                      fontSize: 15,
                    )),
                    const TextSpan(text: '  •  ', style: TextStyle(
                      color: AppPalette.aqua, fontWeight: FontWeight.w900,
                    )),
                    const TextSpan(text: 'Flutter / Dart', style: TextStyle(
                      color: AppPalette.aqua, fontWeight: FontWeight.w700,
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: <Widget>[
                  FilledButton.icon(
                    onPressed: onViewOutline,
                    icon: const Icon(Icons.menu_book_outlined, size: 18),
                    label: const Text('View outline'),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppPalette.navy,
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: onSave,
                    icon: Icon(saved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                        size: 18),
                    label: Text(saved ? 'Saved' : 'Save course'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Color(0x70FFFFFF)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
