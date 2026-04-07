import 'package:flutter/material.dart';

/// Dialogue session screen — EPIC K in MVP backlog.
class DialogueScreen extends StatelessWidget {
  const DialogueScreen({super.key, required this.dialogueId});
  final String dialogueId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('บทสนทนา')),
      body: Center(
        child: Text('บทสนทนา: $dialogueId'),
      ),
    );
  }
}
