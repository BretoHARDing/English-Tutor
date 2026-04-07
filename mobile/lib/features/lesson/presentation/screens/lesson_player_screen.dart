import 'package:flutter/material.dart';

/// The lesson player renders lesson steps sequentially.
/// Full implementation: EPIC F in the MVP backlog.
class LessonPlayerScreen extends StatefulWidget {
  const LessonPlayerScreen({super.key, required this.lessonId});
  final String lessonId;

  @override
  State<LessonPlayerScreen> createState() => _LessonPlayerScreenState();
}

class _LessonPlayerScreenState extends State<LessonPlayerScreen> {
  int _currentStep = 0;
  final int _totalSteps = 5; // placeholder

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() => _currentStep++);
    } else {
      _onLessonComplete();
    }
  }

  void _onLessonComplete() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('ยอดเยี่ยม! 🎉'),
        content: const Text('คุณเรียนบทนี้เสร็จแล้ว'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('ตกลง'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('บทเรียน ${widget.lessonId}'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: (_currentStep + 1) / _totalSteps,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ขั้นตอนที่ ${_currentStep + 1} / $_totalSteps',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            const Placeholder(fallbackHeight: 200),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: _nextStep,
            child: Text(_currentStep < _totalSteps - 1 ? 'ถัดไป' : 'เสร็จสิ้น'),
          ),
        ),
      ),
    );
  }
}
