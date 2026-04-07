import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LessonIntroScreen extends StatelessWidget {
  const LessonIntroScreen({super.key, required this.lessonId});
  final String lessonId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('บทเรียน')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'บทเรียน: $lessonId',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.push('/lesson/$lessonId/play'),
              child: const Text('เริ่มเรียน'),
            ),
          ],
        ),
      ),
    );
  }
}
