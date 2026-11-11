import 'package:flutter/material.dart';

import '../../navigation/app_routes.dart';

class SettingsSection extends StatefulWidget {
  const SettingsSection({
    super.key,
    required this.darkMode,
    required this.onDarkModeChanged,
  });
  final bool darkMode;
  final ValueChanged<bool> onDarkModeChanged;

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  bool _notifyOnUpdates = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      child: Center(child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 850),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text('Preferences', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          Text('Change how the demo looks and explore named routes.',
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          const SizedBox(height: 20),
          Card(child: Column(children: [
            SwitchListTile.adaptive(
              key: const Key('dark-mode-toggle'),
              secondary: const Icon(Icons.dark_mode_outlined),
              title: const Text('Dark mode'),
              subtitle: const Text('Use the dark color theme'),
              value: widget.darkMode,
              onChanged: widget.onDarkModeChanged,
            ),
            const Divider(height: 1),
            SwitchListTile.adaptive(
              secondary: const Icon(Icons.notifications_outlined),
              title: const Text('Notification previews'),
              subtitle: const Text('Local demo setting (no push service)'),
              value: _notifyOnUpdates,
              onChanged: (value) => setState(() => _notifyOnUpdates = value),
            ),
          ])),
          const SizedBox(height: 17),
          Card(child: ListTile(
            key: const Key('about-named-route'),
            leading: const Icon(Icons.info_outline),
            title: const Text('About this project'),
            subtitle: const Text('Open a named route: /about'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).pushNamed(AppRoutes.about),
          )),
          const SizedBox(height: 17),
          Card(child: ListTile(
            key: const Key('log-out'),
            leading: Icon(Icons.logout_rounded, color: theme.colorScheme.error),
            title: const Text('Exit demo workspace'),
            subtitle: const Text('Clear the navigation stack and return to entry'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.login, (route) => false,
            ),
          )),
          const SizedBox(height: 15),
          Text('These settings are in-memory and reset when the application restarts.',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
        ]),
      )),
    );
  }
}
