import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/application/auth_provider.dart';

/// Settings and reminders — EPIC L in MVP backlog.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('ตั้งค่า')),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text('การแจ้งเตือน'),
            trailing: Icon(Icons.chevron_right_rounded),
          ),
          const ListTile(
            leading: Icon(Icons.volume_up_outlined),
            title: Text('ความเร็วเสียง'),
            trailing: Icon(Icons.chevron_right_rounded),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text('ออกจากระบบ'),
            onTap: () => ref.read(authControllerProvider.notifier).signOut(),
          ),
        ],
      ),
    );
  }
}
