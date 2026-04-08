import 'package:flutter/material.dart';

// ── Enums & constants ────────────────────────────────────────────────────

enum AnswerFeedback { correct, incorrect, skipped }

/// Encouragement messages shown after a correct answer.
const _correctMessages = [
  'ยอดเยี่ยม! 🎉',
  'เก่งมาก! ⭐',
  'สุดยอด! 🔥',
  'ถูกต้องเลย! 👏',
  'เข้าใจดีมาก! 💡',
  'ทำได้ดีมาก! 🌟',
];

/// Encouragement messages shown after a wrong answer.
const _incorrectMessages = [
  'ไม่เป็นไร ลองอีกครั้ง! 💪',
  'เกือบถูกแล้ว ครั้งหน้าทำได้! 😊',
  'ฝึกต่อไปนะ คุณทำได้! 🌱',
  'การผิดพลาดช่วยให้เราเรียนรู้ 📚',
];

/// Encouragement copy shown at end of session by score band.
String sessionEndMessage(int correctCount, int totalCount) {
  if (totalCount == 0) return 'เริ่มทบทวนกันเลย! 🚀';
  final pct = correctCount / totalCount;
  if (pct == 1.0) return 'เพอร์เฟกต์! คุณเก่งมาก! 🏆';
  if (pct >= 0.8) return 'ยอดเยี่ยม! ทำได้ดีมาก! 🌟';
  if (pct >= 0.6) return 'ดีมาก! ฝึกต่อไปนะ! 💪';
  if (pct >= 0.4) return 'กำลังพัฒนา! อย่าหยุด! 🌱';
  return 'ทบทวนอีกหน่อยนะ คุณทำได้! 📚';
}

String correctMessage(int index) =>
    _correctMessages[index % _correctMessages.length];

String incorrectMessage(int index) =>
    _incorrectMessages[index % _incorrectMessages.length];

// ── AnswerFeedbackOverlay ─────────────────────────────────────────────────

/// Full-screen momentary overlay that appears after the user answers.
/// Automatically dismisses after [displayDuration].
class AnswerFeedbackOverlay extends StatefulWidget {
  const AnswerFeedbackOverlay({
    super.key,
    required this.feedback,
    required this.message,
    this.displayDuration = const Duration(milliseconds: 900),
    this.onDismissed,
  });

  final AnswerFeedback feedback;
  final String message;
  final Duration displayDuration;
  final VoidCallback? onDismissed;

  @override
  State<AnswerFeedbackOverlay> createState() => _AnswerFeedbackOverlayState();
}

class _AnswerFeedbackOverlayState extends State<AnswerFeedbackOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnim = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    Future.delayed(widget.displayDuration, () {
      if (mounted) widget.onDismissed?.call();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isCorrect = widget.feedback == AnswerFeedback.correct;
    final color =
        isCorrect ? const Color(0xFF34A853) : const Color(0xFFEA4335);
    final icon = isCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded;

    return FadeTransition(
      opacity: _fadeAnim,
      child: Container(
        color: color.withOpacity(0.15),
        child: Center(
          child: ScaleTransition(
            scale: _scaleAnim,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: color, size: 80),
                const SizedBox(height: 16),
                Text(
                  widget.message,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: color,
                        fontWeight: FontWeight.w700,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── XpBadge ───────────────────────────────────────────────────────────────

/// Small animated badge showing XP earned (e.g. "+10 XP").
class XpBadge extends StatefulWidget {
  const XpBadge({super.key, required this.xp});
  final int xp;

  @override
  State<XpBadge> createState() => _XpBadgeState();
}

class _XpBadgeState extends State<XpBadge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnim;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnim,
      child: FadeTransition(
        opacity: _fadeAnim,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFFBBC04),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '+${widget.xp} XP',
            style: const TextStyle(
              fontFamily: 'Kanit',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF202124),
            ),
          ),
        ),
      ),
    );
  }
}

// ── SessionSummaryCard ────────────────────────────────────────────────────

/// End-of-session summary displayed after completing a review or lesson.
class SessionSummaryCard extends StatelessWidget {
  const SessionSummaryCard({
    super.key,
    required this.correctCount,
    required this.totalCount,
    required this.xpEarned,
    required this.onContinue,
    this.onReview,
    this.continueLabel = 'กลับหน้าหลัก',
    this.reviewLabel = 'ทบทวนรายการที่ผิด',
  });

  final int correctCount;
  final int totalCount;
  final int xpEarned;
  final VoidCallback onContinue;
  final VoidCallback? onReview;
  final String continueLabel;
  final String reviewLabel;

  @override
  Widget build(BuildContext context) {
    final message = sessionEndMessage(correctCount, totalCount);
    final pct = totalCount > 0 ? correctCount / totalCount : 0.0;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Score ring
            SizedBox(
              width: 140,
              height: 140,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: pct,
                    strokeWidth: 10,
                    backgroundColor:
                        Theme.of(context).colorScheme.surface,
                    color: pct >= 0.8
                        ? const Color(0xFF34A853)
                        : pct >= 0.5
                            ? const Color(0xFFFBBC04)
                            : const Color(0xFFEA4335),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '$correctCount/$totalCount',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'ถูกต้อง',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            XpBadge(xp: xpEarned),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: onContinue,
              child: Text(continueLabel),
            ),

            if (onReview != null) ...[
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: onReview,
                child: Text(reviewLabel),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ── StreakBanner ──────────────────────────────────────────────────────────

/// Motivational streak banner shown at the top of home/progress screens.
class StreakBanner extends StatelessWidget {
  const StreakBanner({super.key, required this.streakDays});
  final int streakDays;

  @override
  Widget build(BuildContext context) {
    final String copy;
    if (streakDays == 0) {
      copy = 'เริ่มสตรีคของคุณวันนี้! 🔥';
    } else if (streakDays == 1) {
      copy = 'เยี่ยม! คุณเรียนมา 1 วันแล้ว 🔥';
    } else if (streakDays < 7) {
      copy = 'ต่อเนื่อง $streakDays วัน! ดีมาก 🔥';
    } else if (streakDays < 30) {
      copy = '$streakDays วันติดต่อกัน! สุดยอด! 🔥🔥';
    } else {
      copy = '$streakDays วัน! คุณคือแชมป์ 🏆🔥';
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF8C00), Color(0xFFFBBC04)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.local_fire_department_rounded,
              color: Colors.white, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              copy,
              style: const TextStyle(
                fontFamily: 'Kanit',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── StatCard ──────────────────────────────────────────────────────────────

/// Single stat displayed in a card grid on the Progress screen.
class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 10),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: color.withOpacity(0.85)),
          ),
        ],
      ),
    );
  }
}

// ── WeeklyBarChart ────────────────────────────────────────────────────────

/// Simple 7-bar chart showing activity count over the last 7 days.
class WeeklyBarChart extends StatelessWidget {
  const WeeklyBarChart({super.key, required this.dayLabels, required this.values});

  /// Labels for the last 7 days, e.g. ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส']
  final List<String> dayLabels;

  /// Activity counts per day (same length as dayLabels).
  final List<int> values;

  @override
  Widget build(BuildContext context) {
    final maxVal = values.isEmpty ? 1 : values.reduce((a, b) => a > b ? a : b);
    final primaryColor = Theme.of(context).colorScheme.primary;

    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(dayLabels.length, (i) {
          final barFraction = maxVal > 0 ? values[i] / maxVal : 0.0;
          final isToday = i == dayLabels.length - 1;
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 400 + i * 50),
                width: 26,
                height: 60 * barFraction + (values[i] > 0 ? 4 : 2),
                decoration: BoxDecoration(
                  color: isToday
                      ? primaryColor
                      : primaryColor.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                dayLabels[i],
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 11,
                      fontWeight: isToday ? FontWeight.w700 : FontWeight.w400,
                    ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
