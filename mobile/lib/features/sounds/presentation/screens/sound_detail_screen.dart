import 'package:flutter/material.dart';

/// Sound detail screen — EPIC J in MVP backlog.
class SoundDetailScreen extends StatelessWidget {
  const SoundDetailScreen({super.key, required this.soundId});
  final String soundId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เสียง')),
      body: Center(
        child: Text('รายละเอียดเสียง: $soundId'),
      ),
    );
  }
}
