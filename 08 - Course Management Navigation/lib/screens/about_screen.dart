import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('About this demo')),
      body: Center(child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 670),
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const Icon(Icons.route_outlined, size: 64),
            const SizedBox(height: 22),
            Text('Course Management Navigation Demo', textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900)),
            const SizedBox(height: 12),
            const Text('Advanced Mobile Programming · Lecture 08', textAlign: TextAlign.center),
            const SizedBox(height: 24),
            const Card(child: Padding(
              padding: EdgeInsets.all(20),
              child: Text('This screen was opened using Navigator.pushNamed("/about"). '
                  'The back arrow calls Navigator.pop automatically.\n\n'
                  'The Drawer switches sections inside the workspace without '
                  'adding routes. The Courses tabs switch related course lists. '
                  'A course item uses MaterialPageRoute to push details; '
                  'a typed result is returned with Navigator.pop(result).\n\n'
                  'The simulated sign-in uses pushReplacementNamed; exiting the '
                  'demo clears route history with pushNamedAndRemoveUntil.'),
            )),
          ],
        ),
      )),
    );
  }
}
