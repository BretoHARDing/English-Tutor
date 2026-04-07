import 'package:flutter/material.dart';

/// Progress dashboard — EPIC H + N in MVP backlog.
class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ความก้าวหน้า')),
      body: const Center(
        child: Text('ความก้าวหน้าของคุณ'),
      ),
    );
  }
}
