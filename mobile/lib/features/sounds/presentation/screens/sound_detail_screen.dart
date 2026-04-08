import 'package:flutter/material.dart';

import '../../../../shared/widgets/pronunciation_guide_card.dart';
import '../../../../shared/widgets/pronunciation_feedback_widget.dart';

// ── SoundDetailScreen ─────────────────────────────────────────────────────

/// Full pronunciation guide + practice screen for a single English sound.
///
/// Flow:
/// 1. Watch the video (mouth/tongue movement guide, narrated in Thai)
/// 2. Read the step-by-step articulation instructions (expandable)
/// 3. Practice by recording yourself
/// 4. Receive precise, positive, per-dimension feedback
/// 5. "Try again" or advance to next sound
class SoundDetailScreen extends StatefulWidget {
  const SoundDetailScreen({super.key, required this.soundId});
  final String soundId;

  @override
  State<SoundDetailScreen> createState() => _SoundDetailScreenState();
}

class _SoundDetailScreenState extends State<SoundDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  /// Recording state
  bool _isRecording = false;
  bool _recordingDone = false;
  int _attemptCount = 0;

  /// Feedback state
  PronunciationScores? _lastScores;

  SoundGuideData get _guide =>
      kSoundGuides[widget.soundId] ??
      kSoundGuides['th_unvoiced']!; // fallback

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    setState(() {
      _isRecording = true;
      _recordingDone = false;
      _lastScores = null;
    });

    // Simulate 2-second recording delay.
    // In production: use the `record` package to capture audio,
    // upload to Firebase Storage, call a Cloud Function for pronunciation scoring.
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    setState(() {
      _isRecording = false;
      _recordingDone = true;
      _attemptCount++;
      // Demo scores — in production these come from the pronunciation scoring API
      _lastScores = PronunciationScores.fromOverall(55 + (_attemptCount * 8).clamp(0, 40));
    });
  }

  void _tryAgain() {
    setState(() {
      _recordingDone = false;
      _lastScores = null;
    });
  }

  void _nextSound() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_guide.thaiName),
            Text(
              _guide.ipaSymbol,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.play_circle_outline_rounded), text: 'คำแนะนำ'),
            Tab(icon: Icon(Icons.mic_rounded), text: 'ฝึกพูด'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _GuideTab(guide: _guide),
          _PracticeTab(
            guide: _guide,
            isRecording: _isRecording,
            recordingDone: _recordingDone,
            attemptCount: _attemptCount,
            scores: _lastScores,
            onStart: _startRecording,
            onTryAgain: _tryAgain,
            onNext: _nextSound,
            onGoToGuide: () => _tabController.animateTo(0),
          ),
        ],
      ),
    );
  }
}

// ── Guide tab ─────────────────────────────────────────────────────────────

class _GuideTab extends StatelessWidget {
  const _GuideTab({required this.guide});
  final SoundGuideData guide;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: PronunciationGuideCard(guide: guide),
    );
  }
}

// ── Practice tab ──────────────────────────────────────────────────────────

class _PracticeTab extends StatelessWidget {
  const _PracticeTab({
    required this.guide,
    required this.isRecording,
    required this.recordingDone,
    required this.attemptCount,
    required this.scores,
    required this.onStart,
    required this.onTryAgain,
    required this.onNext,
    required this.onGoToGuide,
  });

  final SoundGuideData guide;
  final bool isRecording;
  final bool recordingDone;
  final int attemptCount;
  final PronunciationScores? scores;
  final VoidCallback onStart;
  final VoidCallback onTryAgain;
  final VoidCallback onNext;
  final VoidCallback onGoToGuide;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick-reference card: what to aim for
          _PracticeReferenceCard(guide: guide),
          const SizedBox(height: 24),

          // Recording section
          if (!recordingDone) ...[
            _RecordingSection(
              isRecording: isRecording,
              attemptCount: attemptCount,
              practiceWords: guide.practiceWords,
              ipaSymbol: guide.ipaSymbol,
              onStart: onStart,
              onGoToGuide: onGoToGuide,
            ),
          ] else if (scores != null) ...[
            // Precise feedback
            PrecisePronunciationFeedback(
              scores: scores!,
              soundLabel: guide.thaiName,
              attempt: attemptCount,
              onTryAgain: onTryAgain,
              onNext: onNext,
            ),
          ],
        ],
      ),
    );
  }
}

// ── Quick reference card shown during practice ────────────────────────────

class _PracticeReferenceCard extends StatelessWidget {
  const _PracticeReferenceCard({required this.guide});
  final SoundGuideData guide;

  @override
  Widget build(BuildContext context) {
    // Show first 2 articulation steps as a compact reminder
    final steps = guide.articulationSteps.take(2).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.lightbulb_outline_rounded,
                    color: Theme.of(context).colorScheme.primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  'จำไว้ก่อนอัดเสียง',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...steps.map(
              (s) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(s.icon,
                        size: 16,
                        color: Theme.of(context).colorScheme.secondary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${s.title}: ${s.tip.isNotEmpty ? s.tip : s.description}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Recording section ─────────────────────────────────────────────────────

class _RecordingSection extends StatelessWidget {
  const _RecordingSection({
    required this.isRecording,
    required this.attemptCount,
    required this.practiceWords,
    required this.ipaSymbol,
    required this.onStart,
    required this.onGoToGuide,
  });

  final bool isRecording;
  final int attemptCount;
  final List<String> practiceWords;
  final String ipaSymbol;
  final VoidCallback onStart;
  final VoidCallback onGoToGuide;

  @override
  Widget build(BuildContext context) {
    final practiceWord =
        practiceWords.isNotEmpty ? practiceWords[attemptCount % practiceWords.length] : '';

    return Column(
      children: [
        // First-attempt nudge to watch the video guide
        if (attemptCount == 0) ...[
          GestureDetector(
            onTap: onGoToGuide,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1A73E8).withOpacity(0.07),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.ondemand_video_rounded,
                      color: Color(0xFF1A73E8), size: 18),
                  const SizedBox(width: 8),
                  Text(
                    'ยังไม่แน่ใจ? ดูวิดีโอก่อนได้เลย →',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF1A73E8),
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
        // Word to say
        if (practiceWord.isNotEmpty) ...[
          Text(
            'ออกเสียงคำนี้:',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
              ),
            ),
            child: Column(
              children: [
                Text(
                  practiceWord,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 40,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  ipaSymbol,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: const Color(0xFF5F6368),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],

        // Mic button
        _MicButton(isRecording: isRecording, onPressed: isRecording ? null : onStart),
        const SizedBox(height: 16),

        Text(
          isRecording
              ? 'กำลังฟัง… พูดออกมาเลย! 🎙️'
              : attemptCount == 0
                  ? 'กดปุ่มไมค์แล้วพูดคำนั้น'
                  : 'ลองอีกครั้ง — คุณทำได้ดีขึ้นทุกที!',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),

        if (attemptCount > 0) ...[
          const SizedBox(height: 8),
          Text(
            'ครั้งที่ $attemptCount แล้ว ไม่ยอมแพ้นะ! 💪',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ],
      ],
    );
  }
}

class _MicButton extends StatelessWidget {
  const _MicButton({required this.isRecording, required this.onPressed});
  final bool isRecording;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 88,
        height: 88,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isRecording
              ? const Color(0xFFEA4335)
              : Theme.of(context).colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: (isRecording
                      ? const Color(0xFFEA4335)
                      : Theme.of(context).colorScheme.primary)
                  .withOpacity(0.35),
              blurRadius: isRecording ? 24 : 12,
              spreadRadius: isRecording ? 4 : 0,
            ),
          ],
        ),
        child: Icon(
          isRecording ? Icons.stop_rounded : Icons.mic_rounded,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
