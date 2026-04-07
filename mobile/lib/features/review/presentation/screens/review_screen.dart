import 'package:flutter/material.dart';

/// Review queue screen — EPIC I in MVP backlog.
class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ทบทวน')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 0,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (_, __) => const SizedBox.shrink(),
      ),
    );
  }
}
