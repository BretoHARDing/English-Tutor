import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../shared/widgets/feedback_widgets.dart';

// ── Step model ────────────────────────────────────────────────────────────

enum _StepType { wordCard, multipleChoice, listenAndChoose }

class _LessonStep {
  const _LessonStep({
    required this.type,
    required this.question,
    required this.englishText,
    required this.thaiTranslation,
    required this.choices,
    required this.correctIndex,
    this.pronunciation = '',
    this.hint = '',
  });

  final _StepType type;
  final String question;
  final String englishText;
  final String thaiTranslation;
  final String pronunciation;
  final List<String> choices;
  final int correctIndex;
  final String hint;
}

// Demo steps — in production these come from the lesson document in Firestore.
const _demoSteps = [
  _LessonStep(
    type: _StepType.wordCard,
    question: 'คำว่าอะไรในภาษาอังกฤษ?',
    englishText: 'Hello',
    thaiTranslation: 'สวัสดี',
    pronunciation: '/həˈloʊ/',
    choices: [],
    correctIndex: 0,
    hint: 'ใช้ทักทายตอนเจอกัน',
  ),
  _LessonStep(
    type: _StepType.multipleChoice,
    question: '"Thank you" แปลว่าอะไร?',
    englishText: 'Thank you',
    thaiTranslation: 'ขอบคุณ',
    pronunciation: '/θæŋk juː/',
    choices: ['สวัสดี', 'ขอบคุณ', 'ขอโทษ', 'ลาก่อน'],
    correctIndex: 1,
  ),
  _LessonStep(
    type: _StepType.multipleChoice,
    question: '"Excuse me" หมายความว่าอะไร?',
    englishText: 'Excuse me',
    thaiTranslation: 'ขอโทษ / ขอทาง',
    pronunciation: '/ɪkˈskjuːz miː/',
    choices: ['ขอบคุณ', 'สวัสดี', 'ขอโทษ / ขอทาง', 'ยินดีด้วย'],
    correctIndex: 2,
  ),
  _LessonStep(
    type: _StepType.multipleChoice,
    question: 'ประโยคใดถูกต้อง?',
    englishText: 'How are you?',
    thaiTranslation: 'คุณเป็นอย่างไรบ้าง?',
    choices: [
      'How is you?',
      'How are you?',
      'How you are?',
      'Are you how?',
    ],
    correctIndex: 1,
  ),
  _LessonStep(
    type: _StepType.wordCard,
    question: 'จำคำนี้ไว้!',
    englishText: 'Goodbye',
    thaiTranslation: 'ลาก่อน',
    pronunciation: '/ɡʊdˈbaɪ/',
    choices: [],
    correctIndex: 0,
    hint: 'ใช้อำลาเมื่อจะลากัน',
  ),
];

// ── LessonPlayerScreen ────────────────────────────────────────────────────

class LessonPlayerScreen extends StatefulWidget {
  const LessonPlayerScreen({super.key, required this.lessonId});
  final String lessonId;

  @override
  State<LessonPlayerScreen> createState() => _LessonPlayerScreenState();
}

class _LessonPlayerScreenState extends State<LessonPlayerScreen> {
  final List<_LessonStep> _steps = List.of(_demoSteps);
  int _currentStep = 0;
  int? _selectedChoice;
  bool _answered = false;
  bool _showFeedback = false;
  AnswerFeedback _lastFeedback = AnswerFeedback.correct;
  String _feedbackMessage = '';
  int _feedbackMsgIdx = 0;

  int _correctCount = 0;
  bool _lessonComplete = false;

  _LessonStep get _step => _steps[_currentStep];
  bool get _isWordCard => _step.type == _StepType.wordCard;
  int get _xp => _correctCount * 12 + (_currentStep + 1) * 3;

  void _handleChoice(int choiceIndex) {
    if (_answered) return;
    final isCorrect = choiceIndex == _step.correctIndex;

    setState(() {
      _selectedChoice = choiceIndex;
      _answered = true;
      _showFeedback = true;
      _lastFeedback =
          isCorrect ? AnswerFeedback.correct : AnswerFeedback.incorrect;
      _feedbackMessage = isCorrect
          ? correctMessage(_feedbackMsgIdx)
          : '${incorrectMessage(_feedbackMsgIdx)}\nคำตอบที่ถูก: ${_step.choices[_step.correctIndex]}';
      _feedbackMsgIdx++;
      if (isCorrect) _correctCount++;
    });
  }

  void _onFeedbackDismissed() {
    if (!mounted) return;
    setState(() {
      _showFeedback = false;
      _advanceStep();
    });
  }

  void _acknowledgeWordCard() {
    _correctCount++;
    setState(() {
      _showFeedback = true;
      _lastFeedback = AnswerFeedback.correct;
      _feedbackMessage = correctMessage(_feedbackMsgIdx++);
    });
  }

  void _advanceStep() {
    if (_currentStep < _steps.length - 1) {
      setState(() {
        _currentStep++;
        _selectedChoice = null;
        _answered = false;
      });
    } else {
      setState(() => _lessonComplete = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_lessonComplete) {
      return Scaffold(
        body: SessionSummaryCard(
          correctCount: _correctCount,
          totalCount: _steps.where((s) => s.type != _StepType.wordCard).length,
          xpEarned: _xp,
          onContinue: () => context.go(AppRoutes.home),
          continueLabel: 'กลับหน้าหลัก',
        ),
      );
    }

    final progress = (_currentStep + 1) / _steps.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('บทเรียน ${widget.lessonId}'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),
        ),
      ),
      body: Stack(
        children: [
          _isWordCard
              ? _WordCardStep(
                  step: _step,
                  onAcknowledge: _acknowledgeWordCard,
                )
              : _MultipleChoiceStep(
                  step: _step,
                  selectedChoice: _selectedChoice,
                  onChoiceTap: _answered ? null : _handleChoice,
                ),
          if (_showFeedback)
            AnswerFeedbackOverlay(
              feedback: _lastFeedback,
              message: _feedbackMessage,
              onDismissed: _onFeedbackDismissed,
            ),
        ],
      ),
    );
  }
}

// ── Word card step (informational — learner just reads) ───────────────────

class _WordCardStep extends StatelessWidget {
  const _WordCardStep({required this.step, required this.onAcknowledge});
  final _LessonStep step;
  final VoidCallback onAcknowledge;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        step.englishText,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 42,
                                  color:
                                      Theme.of(context).colorScheme.primary,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      if (step.pronunciation.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(
                          step.pronunciation,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontStyle: FontStyle.italic,
                                    color: const Color(0xFF5F6368),
                                  ),
                        ),
                      ],
                      const SizedBox(height: 20),
                      Container(
                        height: 1,
                        color: const Color(0xFFDADCE0),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        step.thaiTranslation,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      if (step.hint.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Text(
                          '💡 ${step.hint}',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: ElevatedButton(
              onPressed: onAcknowledge,
              child: const Text('เข้าใจแล้ว! ถัดไป'),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Multiple choice step ──────────────────────────────────────────────────

class _MultipleChoiceStep extends StatelessWidget {
  const _MultipleChoiceStep({
    required this.step,
    required this.selectedChoice,
    required this.onChoiceTap,
  });

  final _LessonStep step;
  final int? selectedChoice;
  final void Function(int)? onChoiceTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step.question,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          ...List.generate(
            step.choices.length,
            (i) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ChoiceTile(
                label: step.choices[i],
                index: i,
                selectedIndex: selectedChoice,
                correctIndex: step.correctIndex,
                onTap: onChoiceTap != null ? () => onChoiceTap!(i) : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChoiceTile extends StatelessWidget {
  const _ChoiceTile({
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.correctIndex,
    required this.onTap,
  });

  final String label;
  final int index;
  final int? selectedIndex;
  final int correctIndex;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;
    final bool hasAnswered = selectedIndex != null;
    final bool isCorrect = index == correctIndex;

    Color borderColor = const Color(0xFFDADCE0);
    Color bgColor = Colors.transparent;
    Widget? trailingIcon;

    if (hasAnswered) {
      if (isCorrect) {
        borderColor = const Color(0xFF34A853);
        bgColor = const Color(0xFF34A853).withOpacity(0.1);
        trailingIcon = const Icon(Icons.check_circle_rounded,
            color: Color(0xFF34A853), size: 20);
      } else if (isSelected) {
        borderColor = const Color(0xFFEA4335);
        bgColor = const Color(0xFFEA4335).withOpacity(0.1);
        trailingIcon = const Icon(Icons.cancel_rounded,
            color: Color(0xFFEA4335), size: 20);
      }
    } else if (isSelected) {
      borderColor = Theme.of(context).colorScheme.primary;
      bgColor = Theme.of(context).colorScheme.primary.withOpacity(0.08);
    }

    return GestureDetector(
      onTap: hasAnswered ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor, width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            if (trailingIcon != null) trailingIcon,
          ],
        ),
      ),
    );
  }
}
