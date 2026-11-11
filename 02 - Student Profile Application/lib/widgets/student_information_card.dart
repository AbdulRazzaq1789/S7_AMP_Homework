import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/student.dart';

/// The third-party `intl` package formats the student's enrollment date.
class StudentInformationCard extends StatelessWidget {
  const StudentInformationCard({super.key, required this.student});
  final Student student;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(child: Padding(
      padding: const EdgeInsets.all(22),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Student information', style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        _InfoRow(icon: Icons.account_balance_outlined, title: 'University', value: student.university),
        const Divider(height: 24),
        _InfoRow(icon: Icons.calendar_today_outlined, title: 'Enrolled', value: DateFormat('MMMM yyyy').format(student.enrolledOn)),
        const Divider(height: 24),
        _InfoRow(icon: Icons.mail_outline, title: 'Email', value: student.email),
        const Divider(height: 24),
        _InfoRow(icon: Icons.menu_book_outlined, title: 'Department', value: student.department),
      ]),
    ));
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.title, required this.value});
  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(icon, color: theme.colorScheme.onSurfaceVariant, size: 20),
      const SizedBox(width: 12),
      Expanded(child: Text(title, style: theme.textTheme.bodyMedium)),
      const SizedBox(width: 10),
      Flexible(child: Text(value, textAlign: TextAlign.right,
        style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700))),
    ]);
  }
}
