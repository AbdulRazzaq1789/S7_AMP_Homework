import 'package:flutter/material.dart';

import '../controllers/xylophone_controller.dart';
import '../services/note_audio.dart';
import '../theme/app_theme.dart';
import '../widgets/instrument_panel.dart';
import '../widgets/play_controls.dart';
import '../widgets/session_card.dart';

class XylophoneScreen extends StatefulWidget {
  const XylophoneScreen({super.key, this.audio});
  final NoteAudio? audio;

  @override
  State<XylophoneScreen> createState() => _XylophoneScreenState();
}

class _XylophoneScreenState extends State<XylophoneScreen> {
  late final XylophoneController _controller;

  @override
  void initState() {
    super.initState();
    _controller = XylophoneController(widget.audio ?? BundledNoteAudio());
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0D2734), AppPalette.background, Color(0xFF091322)],
          ),
        ),
        child: SafeArea(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) => LayoutBuilder(
              builder: (context, constraints) {
                final wide = constraints.maxWidth >= 850;
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: wide ? 40 : 20, vertical: 26),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1050),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        _buildHeader(),
                        const SizedBox(height: 34),
                        Text('Make a little\nmagic with music.',
                          style: TextStyle(fontSize: wide ? 43 : 34, fontWeight: FontWeight.w900, height: 1.13, letterSpacing: -1.5, color: AppPalette.cream)),
                        const SizedBox(height: 13),
                        const Text('Seven colorful bars. Endless ways to play.', style: TextStyle(color: AppPalette.muted, fontSize: 15)),
                        const SizedBox(height: 25),
                        if (_controller.error != null) ...[
                          _errorBanner(),
                          const SizedBox(height: 20),
                        ],
                        if (wide)
                          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Expanded(flex: 7, child: InstrumentPanel(controller: _controller)),
                            const SizedBox(width: 24),
                            Expanded(flex: 5, child: Column(children: [
                              SessionCard(controller: _controller),
                              const SizedBox(height: 16),
                              PlayControls(controller: _controller),
                              const SizedBox(height: 20),
                              _practiceTip(),
                            ])),
                          ])
                        else ...[
                          InstrumentPanel(controller: _controller),
                          const SizedBox(height: 17),
                          PlayControls(controller: _controller),
                          const SizedBox(height: 17),
                          SessionCard(controller: _controller),
                          const SizedBox(height: 17),
                          _practiceTip(),
                        ],
                        const SizedBox(height: 30),
                        Center(child: Text(_controller.isReady ? 'ALL SOUNDS LOADED · PLAY OFFLINE' : 'LOADING LOCAL AUDIO…',
                          style: const TextStyle(fontSize: 10, letterSpacing: 1.6, fontWeight: FontWeight.w800, color: AppPalette.muted))),
                        const SizedBox(height: 10),
                      ]),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(children: [
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppPalette.turquoise, borderRadius: BorderRadius.circular(17)),
        child: const Icon(Icons.music_note_rounded, color: Color(0xFF0D2431), size: 25),
      ),
      const SizedBox(width: 12),
      const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('XYLOPHONE', style: TextStyle(fontSize: 17, letterSpacing: 1.6, fontWeight: FontWeight.w900)),
        Text('PLAYGROUND', style: TextStyle(fontSize: 10, letterSpacing: 3, fontWeight: FontWeight.w800, color: AppPalette.turquoise)),
      ])),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(border: Border.all(color: AppPalette.border), borderRadius: BorderRadius.circular(20)),
        child: const Text('WEEK 04', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 10, letterSpacing: 1.1)),
      ),
    ]);
  }

  Widget _errorBanner() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: const Color(0xFF643236), borderRadius: BorderRadius.circular(14)),
      child: Row(children: [
        const Icon(Icons.error_outline_rounded, color: Colors.white),
        const SizedBox(width: 10),
        Expanded(child: Text(_controller.error!, style: const TextStyle(fontSize: 12))),
        TextButton(onPressed: () { _controller.dismissError(); _controller.initialize(); }, child: const Text('Retry')),
      ]),
    );
  }

  Widget _practiceTip() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppPalette.turquoise.withValues(alpha: 0.24)),
        color: AppPalette.turquoise.withValues(alpha: 0.07),
      ),
      child: const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(Icons.lightbulb_outline_rounded, color: AppPalette.turquoise, size: 21),
        SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('TRY THIS', style: TextStyle(fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.w900, color: AppPalette.turquoise)),
          SizedBox(height: 5),
          Text('Start with C · E · G to make a C-major chord. Then try all seven notes!',
            style: TextStyle(fontSize: 13, height: 1.45, color: AppPalette.cream)),
        ])),
      ]),
    );
  }
}
