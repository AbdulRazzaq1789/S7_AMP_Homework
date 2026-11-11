import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';
import '../theme/app_theme.dart';

/// A deliberately simulated entry screen; there is NO authentication backend.
/// The entry action uses pushReplacementNamed, removing this route from Back.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 82, width: 82,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [AppTheme.brand, Color(0xFF7388F3)]),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(Icons.school_rounded, size: 43, color: Colors.white),
                  ),
                  const SizedBox(height: 32),
                  Text('Your courses, in one place.',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w800, letterSpacing: -1.1,
                      )),
                  const SizedBox(height: 10),
                  Text('Browse your subjects, track progress and navigate between '
                      'screens in this Flutter navigation demo.',
                      style: theme.textTheme.bodyLarge?.copyWith(color: AppTheme.muted, height: 1.55)),
                  const SizedBox(height: 32),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Icon(Icons.account_circle_outlined, color: colors.primary),
                            const SizedBox(width: 10),
                            Text('Student workspace', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                          ]),
                          const SizedBox(height: 10),
                          Text('Academic navigation demo · Offline sample data',
                              style: theme.textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant)),
                          const SizedBox(height: 22),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton.icon(
                              key: const Key('enter-workspace'),
                              onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.workspace),
                              icon: const Icon(Icons.arrow_forward_rounded),
                              label: const Text('Enter demo workspace'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(children: [
                    Icon(Icons.info_outline, size: 18, color: colors.outline),
                    const SizedBox(width: 8),
                    Expanded(child: Text('No credentials are needed. This login flow only illustrates route replacement.',
                        style: theme.textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant))),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
