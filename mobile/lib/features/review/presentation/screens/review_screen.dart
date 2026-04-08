import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../shared/widgets/feedback_widgets.dart';
import '../../../../shared/widgets/pronunciation_guide_card.dart';
import '../../../../shared/widgets/pronunciation_feedback_widget.dart';

// ── Demo data ─────────────────────────────────────────────────────────────
// In production these come from the getDueReviews Cloud Function callable.
// The data model here matches the ReviewQueueItem interface from the backend.

class _ReviewItem {
  const _ReviewItem({
    required this.reviewId,
    required this.contentType,
    required this.front,
    required this.back,
    required this.pronunciation,
    required this.exerciseType,
    this.soundId,
  });

  final String reviewId;
  final String contentType; // 'word' | 'sound' | 'sentence'
  final String front;       // English word / sentence
  final String back;        // Thai translation
  final String pronunciation; // IPA or phonetic guide
  final String exerciseType;

  /// For contentType == 'sound': maps to a SoundGuideData key
  final String? soundId;
}

const _demoItems = <_ReviewItem>[
  _ReviewItem(
    reviewId: 'word_hello',
    contentType: 'word',
    front: 'Hello',
    back: 'สวัสดี',
    pronunciation: '/həˈloʊ/',
    exerciseType: 'word_flashcard',
  ),
  _ReviewItem(
    reviewId: 'word_thank_you',
    contentType: 'word',
    front: 'Thank you',
    back: 'ขอบคุณ',
    pronunciation: '/θæŋk juː/',
    exerciseType: 'word_flashcard',
  ),
  _ReviewItem(
    reviewId: 'sentence_how_are_you',
    contentType: 'sentence',
    front: 'How are you?',
    back: 'คุณเป็นอย่างไรบ้าง?',
    pronunciation: '/haʊ ɑːr juː/',
    exerciseType: 'speak_sentence',
  ),
  _ReviewItem(
    reviewId: 'word_goodbye',
    contentType: 'word',
    front: 'Goodbye',
    back: 'ลาก่อน',
    pronunciation: '/ɡʊdˈbaɪ/',
    exerciseType: 'word_flashcard',
  ),
  _ReviewItem(
    reviewId: 'word_please',
    contentType: 'word',
    front: 'Please',
    back: 'กรุณา / ได้โปรด',
    pronunciation: '/pliːz/',
    exerciseType: 'word_flashcard',
  ),
  // Sound review — shows video guide + microphone practice with precise feedback
  _ReviewItem(
    reviewId: 'sound_th_unvoiced',
    contentType: 'sound',
    front: 'เสียง TH ไม่ก้อง',
    back: 'think, three, thank you',
    pronunciation: '/θ/',
    exerciseType: 'sound_practice',
    soundId: 'th_unvoiced',
  ),
  _ReviewItem(
    reviewId: 'sound_v',
    contentType: 'sound',
    front: 'เสียง V',
    back: 'very, video, voice',
    pronunciation: '/v/',
    exerciseType: 'sound_practice',
    soundId: 'v',
  ),
];

// ── Rating definition ─────────────────────────────────────────────────────

enum _Rating { hard, good, easy }

extension _RatingExt on _Rating {
  String get label {
    switch (this) {
      case _Rating.hard:
        return 'ยาก';
      case _Rating.good:
        return 'พอได้';
      case _Rating.easy:
        return 'ง่าย';
    }
  }

  Color get color {
    switch (this) {
      case _Rating.hard:
        return const Color(0xFFEA4335);
      case _Rating.good:
        return const Color(0xFFFBBC04);
      case _Rating.easy:
        return const Color(0xFF34A853);
    }
  }

  IconData get icon {
    switch (this) {
      case _Rating.hard:
        return Icons.sentiment_dissatisfied_outlined;
      case _Rating.good:
        return Icons.sentiment_neutral_outlined;
      case _Rating.easy:
        return Icons.sentiment_very_satisfied_outlined;
    }
  }

  /// SM-2 quality value (0–5)
  int get quality {
    switch (this) {
      case _Rating.hard:
        return 1;
      case _Rating.good:
        return 3;
      case _Rating.easy:
        return 5;
    }
  }
}

// ── ReviewScreen ──────────────────────────────────────────────────────────

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final List<_ReviewItem> _items = List.of(_demoItems);

  int _currentIndex = 0;
  bool _isFlipped = false;
  bool _showFeedback = false;
  AnswerFeedback _lastFeedback = AnswerFeedback.correct;
  String _feedbackMessage = '';
  int _feedbackMessageIndex = 0;

  // Sound practice state
  bool _soundRecording = false;
  bool _soundDone = false;
  int _soundAttempt = 0;
  PronunciationScores? _soundScores;

  // Session stats
  int _hardCount = 0;
  int _goodCount = 0;
  int _easyCount = 0;
  bool _sessionComplete = false;

  bool get _hasItems => _items.isNotEmpty;
  _ReviewItem? get _current =>
      _hasItems && _currentIndex < _items.length ? _items[_currentIndex] : null;
  bool get _isSoundItem => _current?.contentType == 'sound';

  int get _totalRated => _hardCount + _goodCount + _easyCount;
  int get _correctCount => _goodCount + _easyCount;
  int get _xpEarned =>
      _easyCount * 15 + _goodCount * 10 + _hardCount * 5;

  void _flip() {
    if (_showFeedback) return;
    setState(() => _isFlipped = !_isFlipped);
  }

  void _rate(_Rating rating) {
    if (!_isFlipped || _showFeedback) return;

    setState(() {
      _lastFeedback = rating == _Rating.hard
          ? AnswerFeedback.incorrect
          : AnswerFeedback.correct;
      _feedbackMessage = rating == _Rating.hard
          ? incorrectMessage(_feedbackMessageIndex)
          : correctMessage(_feedbackMessageIndex);
      _feedbackMessageIndex++;
      _showFeedback = true;

      switch (rating) {
        case _Rating.hard:
          _hardCount++;
          break;
        case _Rating.good:
          _goodCount++;
          break;
        case _Rating.easy:
          _easyCount++;
          break;
      }
    });
  }

  void _onFeedbackDismissed() {
    if (!mounted) return;
    setState(() {
      _showFeedback = false;
      _isFlipped = false;
      _advanceItem();
    });
  }

  void _advanceItem() {
    if (_currentIndex < _items.length - 1) {
      _currentIndex++;
      // Reset sound state for next item
      _soundRecording = false;
      _soundDone = false;
      _soundAttempt = 0;
      _soundScores = null;
    } else {
      _sessionComplete = true;
    }
  }

  // ── Sound practice callbacks ──────────────────────────────────────────

  Future<void> _startSoundRecording() async {
    setState(() {
      _soundRecording = true;
      _soundDone = false;
      _soundScores = null;
    });
    // Simulate async scoring — replace with real recording + Cloud Function call
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() {
      _soundRecording = false;
      _soundDone = true;
      _soundAttempt++;
      _soundScores = PronunciationScores.fromOverall(
          55 + (_soundAttempt * 10).clamp(0, 40));
    });
  }

  void _soundTryAgain() {
    setState(() {
      _soundDone = false;
      _soundScores = null;
    });
  }

  void _soundNext() {
    // Count a good score as "good", anything lower as "hard"
    final score = _soundScores?.overall ?? 0;
    setState(() {
      if (score >= 65) {
        _goodCount++;
      } else {
        _hardCount++;
      }
      _advanceItem();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_sessionComplete) {
      return Scaffold(
        body: SessionSummaryCard(
          correctCount: _correctCount,
          totalCount: _totalRated,
          xpEarned: _xpEarned,
          onContinue: () => context.go(AppRoutes.home),
          onReview: _hardCount > 0
              ? () {
                  // Restart just the hard ones
                  setState(() {
                    _currentIndex = 0;
                    _hardCount = 0;
                    _goodCount = 0;
                    _easyCount = 0;
                    _sessionComplete = false;
                    _isFlipped = false;
                    _showFeedback = false;
                  });
                }
              : null,
          reviewLabel: 'ทบทวนรายการที่ยาก ($_hardCount รายการ)',
        ),
      );
    }

    if (!_hasItems) {
      return Scaffold(
        appBar: AppBar(title: const Text('ทบทวน')),
        body: const _EmptyReviewState(),
      );
    }

    final item = _current!;
    final progress = (_currentIndex + 1) / _items.length;

    // Sound items get the video guide + precise feedback experience
    if (_isSoundItem) {
      final guide = kSoundGuides[item.soundId] ?? kSoundGuides['th_unvoiced']!;
      return Scaffold(
        appBar: AppBar(
          title: Text('ทบทวนเสียง ${_currentIndex + 1}/${_items.length}'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
        body: _SoundReviewBody(
          guide: guide,
          isRecording: _soundRecording,
          recordingDone: _soundDone,
          attemptCount: _soundAttempt,
          scores: _soundScores,
          onStart: _startSoundRecording,
          onTryAgain: _soundTryAgain,
          onNext: _soundNext,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('ทบทวน ${_currentIndex + 1}/${_items.length}'),
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
          _ReviewBody(
            item: item,
            isFlipped: _isFlipped,
            onFlip: _flip,
            onRate: _isFlipped && !_showFeedback ? _rate : null,
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

// ── Empty state ───────────────────────────────────────────────────────────

class _EmptyReviewState extends StatelessWidget {
  const _EmptyReviewState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              size: 72,
              color: const Color(0xFF34A853),
            ),
            const SizedBox(height: 20),
            Text(
              'ไม่มีรายการที่ต้องทบทวน! 🎉',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'คุณทบทวนครบทุกรายการแล้ว\nกลับมาใหม่พรุ่งนี้',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('กลับหน้าหลัก'),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Review body ───────────────────────────────────────────────────────────

class _ReviewBody extends StatelessWidget {
  const _ReviewBody({
    required this.item,
    required this.isFlipped,
    required this.onFlip,
    required this.onRate,
  });

  final _ReviewItem item;
  final bool isFlipped;
  final VoidCallback onFlip;
  final void Function(_Rating)? onRate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: GestureDetector(
              onTap: onFlip,
              child: _FlashCard(item: item, isFlipped: isFlipped),
            ),
          ),
        ),
        if (!isFlipped)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            child: OutlinedButton.icon(
              onPressed: onFlip,
              icon: const Icon(Icons.flip_rounded),
              label: const Text('เปิดดูคำตอบ'),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            child: _RatingButtons(onRate: onRate),
          ),
      ],
    );
  }
}

// ── Flashcard ─────────────────────────────────────────────────────────────

class _FlashCard extends StatelessWidget {
  const _FlashCard({required this.item, required this.isFlipped});

  final _ReviewItem item;
  final bool isFlipped;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      transitionBuilder: (child, animation) {
        final rotate = Tween(begin: 0.0, end: 1.0).animate(animation);
        return AnimatedBuilder(
          animation: rotate,
          child: child,
          builder: (_, child) => child!,
        );
      },
      child: isFlipped
          ? _CardFace.back(item: item, key: const ValueKey('back'))
          : _CardFace.front(item: item, key: const ValueKey('front')),
    );
  }
}

class _CardFace extends StatelessWidget {
  const _CardFace.front({super.key, required this.item})
      : isFront = true;
  const _CardFace.back({super.key, required this.item})
      : isFront = false;

  final _ReviewItem item;
  final bool isFront;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Content type badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                isFront
                    ? _frontLabel(item.contentType)
                    : 'ความหมาย',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 28),

            // Main text
            Text(
              isFront ? item.front : item.back,
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: isFront ? 36 : 28,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Pronunciation (front only)
            if (isFront)
              Text(
                item.pronunciation,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFF5F6368),
                  fontStyle: FontStyle.italic,
                ),
              ),

            // English on back
            if (!isFront) ...[
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 16),
              Text(
                item.front,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF5F6368),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.pronunciation,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF9AA0A6),
                ),
              ),
            ],

            const SizedBox(height: 20),
            if (isFront)
              Text(
                'แตะการ์ดเพื่อดูคำตอบ',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF9AA0A6),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _frontLabel(String contentType) {
    switch (contentType) {
      case 'word':
        return 'คำศัพท์';
      case 'sentence':
        return 'ประโยค';
      case 'sound':
        return 'เสียง';
      default:
        return 'ทบทวน';
    }
  }
}

// ── Rating buttons ────────────────────────────────────────────────────────

class _RatingButtons extends StatelessWidget {
  const _RatingButtons({required this.onRate});
  final void Function(_Rating)? onRate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'คุณจำได้แค่ไหน?',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        Row(
          children: _Rating.values.map((r) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _RatingButton(
                  rating: r,
                  onTap: onRate != null ? () => onRate!(r) : null,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _RatingButton extends StatelessWidget {
  const _RatingButton({required this.rating, required this.onTap});
  final _Rating rating;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: rating.color.withOpacity(0.1),
          border: Border.all(color: rating.color.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(rating.icon, color: rating.color, size: 24),
            const SizedBox(height: 4),
            Text(
              rating.label,
              style: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: rating.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Sound review body ─────────────────────────────────────────────────────
// Shown instead of the flashcard when the current review item is a sound.
// Embeds the pronunciation video guide then the practice + precise feedback.

class _SoundReviewBody extends StatefulWidget {
  const _SoundReviewBody({
    required this.guide,
    required this.isRecording,
    required this.recordingDone,
    required this.attemptCount,
    required this.scores,
    required this.onStart,
    required this.onTryAgain,
    required this.onNext,
  });

  final SoundGuideData guide;
  final bool isRecording;
  final bool recordingDone;
  final int attemptCount;
  final PronunciationScores? scores;
  final VoidCallback onStart;
  final VoidCallback onTryAgain;
  final VoidCallback onNext;

  @override
  State<_SoundReviewBody> createState() => _SoundReviewBodyState();
}

class _SoundReviewBodyState extends State<_SoundReviewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // Jump straight to practice tab if already attempted
    if (widget.attemptCount > 0) {
      _tabController.index = 1;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tab bar
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.play_circle_outline_rounded), text: 'ดูวิดีโอ'),
            Tab(icon: Icon(Icons.mic_rounded), text: 'ฝึกพูด'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              // Tab 0 — Video guide
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: PronunciationGuideCard(
                  guide: widget.guide,
                  showPracticeWords: true,
                ),
              ),
              // Tab 1 — Record + feedback
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: widget.recordingDone && widget.scores != null
                    ? PrecisePronunciationFeedback(
                        scores: widget.scores!,
                        soundLabel: widget.guide.thaiName,
                        attempt: widget.attemptCount,
                        onTryAgain: widget.onTryAgain,
                        onNext: widget.onNext,
                      )
                    : _SoundPracticePrompt(
                        guide: widget.guide,
                        isRecording: widget.isRecording,
                        attemptCount: widget.attemptCount,
                        onStart: widget.onStart,
                        onSkipToGuide: () => _tabController.animateTo(0),
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SoundPracticePrompt extends StatelessWidget {
  const _SoundPracticePrompt({
    required this.guide,
    required this.isRecording,
    required this.attemptCount,
    required this.onStart,
    required this.onSkipToGuide,
  });

  final SoundGuideData guide;
  final bool isRecording;
  final int attemptCount;
  final VoidCallback onStart;
  final VoidCallback onSkipToGuide;

  @override
  Widget build(BuildContext context) {
    final practiceWord = guide.practiceWords.isNotEmpty
        ? guide.practiceWords[attemptCount % guide.practiceWords.length]
        : guide.ipaSymbol;

    return Column(
      children: [
        // Reminder tip
        if (attemptCount == 0)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF1A73E8).withOpacity(0.07),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.ondemand_video_rounded,
                    color: Color(0xFF1A73E8), size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: onSkipToGuide,
                    child: Text(
                      'ยังไม่แน่ใจ? ดูวิดีโอก่อนได้เลย →',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF1A73E8),
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 24),

        // Word prompt
        Text('ออกเสียงคำนี้:', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          decoration: BoxDecoration(
            color:
                Theme.of(context).colorScheme.primary.withOpacity(0.06),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color:
                  Theme.of(context).colorScheme.primary.withOpacity(0.25),
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
                guide.ipaSymbol,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: const Color(0xFF5F6368),
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // Mic button
        GestureDetector(
          onTap: isRecording ? null : onStart,
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
        ),
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
