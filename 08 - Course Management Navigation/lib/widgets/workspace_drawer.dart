import 'package:flutter/material.dart';

class WorkspaceDrawer extends StatelessWidget {
  const WorkspaceDrawer({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  static const labels = ['Home', 'Courses', 'Profile', 'Settings'];
  static const icons = [
    Icons.space_dashboard_rounded,
    Icons.menu_book_rounded,
    Icons.person_rounded,
    Icons.tune_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 26),
              child: Row(children: [
                CircleAvatar(
                  backgroundColor: colors.primaryContainer,
                  child: Icon(Icons.school_rounded, color: colors.onPrimaryContainer),
                ),
                const SizedBox(width: 12),
                const Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CAMPUS', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.3)),
                    Text('Student portal', style: TextStyle(fontSize: 12)),
                  ],
                )),
              ]),
            ),
            const Divider(),
            const SizedBox(height: 14),
            for (var index = 0; index < labels.length; index++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                child: ListTile(
                  key: Key('nav-${labels[index].toLowerCase()}'),
                  leading: Icon(icons[index]),
                  title: Text(labels[index]),
                  selected: selectedIndex == index,
                  selectedTileColor: colors.primaryContainer.withOpacity(0.55),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  onTap: () => onSelected(index),
                ),
              ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(children: [
                Icon(Icons.info_outline, size: 18, color: colors.onSurfaceVariant),
                const SizedBox(width: 8),
                const Expanded(child: Text('Week 08 · Navigation & Routing', style: TextStyle(fontSize: 12))),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
