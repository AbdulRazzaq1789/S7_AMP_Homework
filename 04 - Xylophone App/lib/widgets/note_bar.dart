import 'package:flutter/material.dart';

import '../models/musical_note.dart';

class NoteBar extends StatefulWidget {
  const NoteBar({
    super.key,
    required this.note,
    required this.index,
    required this.active,
    required this.enabled,
    required this.onPressed,
  });

  final MusicalNote note;
  final int index;
  final bool active;
  final bool enabled;
  final VoidCallback onPressed;

  @override
  State<NoteBar> createState() => _NoteBarState();
}

class _NoteBarState extends State<NoteBar> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final note = widget.note;
    return Align(
      alignment: Alignment.center,
      child: FractionallySizedBox(
        widthFactor: 1 - widget.index * 0.035,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Semantics(
            button: true,
            enabled: widget.enabled,
            label: 'Play note ${note.label}, ${note.solfege}',
            child: AnimatedScale(
              scale: _pressed ? 0.982 : 1,
              duration: const Duration(milliseconds: 95),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                height: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: note.color,
                  boxShadow: widget.active
                      ? [BoxShadow(color: note.color.withValues(alpha: 0.32), blurRadius: 18, offset: const Offset(0, 6))]
                      : const [],
                  border: Border.all(
                    color: widget.active ? Colors.white.withValues(alpha: 0.9) : Colors.white.withValues(alpha: 0.12),
                    width: widget.active ? 2 : 1,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    key: Key('note-${note.id}'),
                    onTap: widget.enabled ? widget.onPressed : null,
                    onTapDown: (_) => setState(() => _pressed = true),
                    onTapCancel: () => setState(() => _pressed = false),
                    onTapUp: (_) => setState(() => _pressed = false),
                    borderRadius: BorderRadius.circular(13),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF162333).withValues(alpha: 0.34),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(note.solfege, style: const TextStyle(fontSize: 14, letterSpacing: 2, fontWeight: FontWeight.w900, color: Color(0xFF172332))),
                          const Spacer(),
                          Text(note.label, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Color(0xFF172332))),
                          const SizedBox(width: 12),
                          Icon(Icons.music_note_rounded, size: 20, color: const Color(0xFF172332).withValues(alpha: 0.67)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
