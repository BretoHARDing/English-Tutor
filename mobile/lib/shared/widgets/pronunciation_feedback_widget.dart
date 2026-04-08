import 'package:flutter/material.dart';

// ── Data model ────────────────────────────────────────────────────────────

/// Per-dimension pronunciation score (0–100).
class PronunciationScores {
  const PronunciationScores({
    required this.tonguePosition,
    required this.lipShape,
    required this.teethUsage,
    required this.clarity,
    required this.rhythm,
  });

  /// ตำแหน่งลิ้น — how correctly the tongue is placed
  final int tonguePosition;

  /// รูปปาก / ริมฝีปาก — lip rounding and spread
  final int lipShape;

  /// การใช้ฟัน — teeth involvement (for /θ/, /v/, etc.)
  final int teethUsage;

  /// ความชัดเจน — overall sound clarity
  final int clarity;

  /// จังหวะ — timing and rhythm
  final int rhythm;

  int get overall =>
      ((tonguePosition + lipShape + teethUsage + clarity + rhythm) / 5).round();

  /// Demo: generate plausible scores from a single overall score.
  factory PronunciationScores.fromOverall(int overall) {
    final base = overall.clamp(20, 100);
    // Add slight variation per dimension for realism
    int _vary(int v) => (v + (_rand(v) % 15) - 7).clamp(10, 100);

    return PronunciationScores(
      tonguePosition: _vary(base),
      lipShape: _vary(base + 3),
      teethUsage: _vary(base - 2),
      clarity: _vary(base + 1),
      rhythm: _vary(base + 5),
    );
  }
}

int _rand(int seed) => (seed * 1103515245 + 12345) & 0x7fffffff;

// ── Feedback copy engine ──────────────────────────────────────────────────

/// Returns a precise, positive feedback sentence for a given dimension score.
/// Feedback is in Thai and always starts with something encouraging.
class _FeedbackCopy {
  static String tonguePosition(int score) {
    if (score >= 85) return 'ตำแหน่งลิ้นสมบูรณ์แบบมาก! คุณวางลิ้นได้ถูกต้องเลย 🌟';
    if (score >= 70) return 'ตำแหน่งลิ้นดีมาก! ลองยกลิ้นขึ้นอีกนิดหน่อยเพื่อให้ชัดขึ้น';
    if (score >= 55) return 'ลิ้นอยู่ใกล้ตำแหน่งที่ถูกต้องแล้ว ลองฝึกตามวิดีโออีกครั้ง';
    return 'ดีที่พยายาม! ดูวิดีโอและสังเกตตำแหน่งลิ้นให้ชัดขึ้น คุณทำได้แน่นอน 💪';
  }

  static String lipShape(int score) {
    if (score >= 85) return 'รูปปากถูกต้องมาก! ริมฝีปากของคุณอยู่ในตำแหน่งที่สมบูรณ์ 👏';
    if (score >= 70) return 'รูปปากดีมาก! ลองห่อปากเพิ่มอีกเล็กน้อยเพื่อให้เสียงชัดขึ้น';
    if (score >= 55) return 'ริมฝีปากใกล้ถูกต้องแล้ว ลองสังเกตวิดีโอรูปปากให้มากขึ้น';
    return 'ไม่เป็นไร! รูปปากเป็นสิ่งที่ฝึกได้ ดูวิดีโอช้าๆ แล้วลองทำตาม 😊';
  }

  static String teethUsage(int score) {
    if (score >= 85) return 'การใช้ฟันสมบูรณ์แบบ! คุณเข้าใจการวางฟันได้ดีเยี่ยม 🎯';
    if (score >= 70) return 'การใช้ฟันดีมาก! ลองให้ฟันสัมผัสกับลิ้นมากขึ้นอีกหน่อย';
    if (score >= 55) return 'ดีขึ้นมาก! ตรวจสอบว่าฟันบนอยู่ในตำแหน่งที่ถูกต้องในวิดีโอ';
    return 'เยี่ยม ที่ลองแล้ว! การวางฟันต้องฝึกสักพัก ดูขั้นตอนที่ 2 ในคำแนะนำอีกครั้ง';
  }

  static String clarity(int score) {
    if (score >= 85) return 'เสียงชัดเจนมากเลย! คนฟังเข้าใจได้ทันที 🔊';
    if (score >= 70) return 'เสียงค่อนข้างชัดเจน! ลองเน้นเสียงให้ชัดขึ้นอีกเล็กน้อย';
    if (score >= 55) return 'เสียงเริ่มชัดขึ้นแล้ว! ลองพูดช้าๆ เน้นเสียงมากขึ้น';
    return 'ดีที่ฝึกอยู่! ความชัดเจนดีขึ้นทุกครั้งที่ฝึก ลองพูดช้าๆ ก่อน 🌱';
  }

  static String rhythm(int score) {
    if (score >= 85) return 'จังหวะเป๊ะมากเลย! เสียงฟังธรรมชาติมาก 🎵';
    if (score >= 70) return 'จังหวะดีมาก! ลองฝึกพูดตามเสียงในวิดีโอให้ราบรื่นขึ้น';
    if (score >= 55) return 'จังหวะดีขึ้นเรื่อยๆ! ลองฟังเสียงต้นแบบแล้วพูดตามช้าๆ';
    return 'จังหวะมาดีขึ้นเรื่อยๆ นะ! ลองฟังและพูดตามทีละคำ ค่อยๆ เร็วขึ้น 🎶';
  }

  /// One actionable improvement tip based on the lowest scoring dimension.
  static String mainTip(PronunciationScores scores) {
    final dims = [
      (score: scores.tonguePosition, tip: 'ลองสังเกตตำแหน่งลิ้นในวิดีโออีกครั้ง แล้วทำตามช้าๆ'),
      (score: scores.lipShape, tip: 'ฝึกรูปปากต่อหน้ากระจก เทียบกับวิดีโอ'),
      (score: scores.teethUsage, tip: 'ตรวจสอบการวางฟันในขั้นตอนที่ 2 ของคำแนะนำ'),
      (score: scores.clarity, tip: 'พูดช้าๆ ทีละเสียง เน้นทุก phoneme ให้ชัด'),
      (score: scores.rhythm, tip: 'ฟังและพูดตามวิดีโอจนรู้สึกธรรมชาติ'),
    ];
    dims.sort((a, b) => a.score.compareTo(b.score));
    return '💡 เคล็ดลับ: ${dims.first.tip}';
  }
}

// ── Precise pronunciation feedback widget ─────────────────────────────────

/// Displays a rich, positive, dimension-by-dimension pronunciation score card.
/// Designed to be shown after the learner records a practice attempt.
class PrecisePronunciationFeedback extends StatefulWidget {
  const PrecisePronunciationFeedback({
    super.key,
    required this.scores,
    required this.soundLabel,
    required this.attempt,
    required this.onTryAgain,
    required this.onNext,
  });

  /// The scores for this attempt.
  final PronunciationScores scores;

  /// Label shown at the top, e.g. 'เสียง /θ/ ไม่ก้อง'.
  final String soundLabel;

  /// Which attempt number this is (1, 2, 3, …).
  final int attempt;

  final VoidCallback onTryAgain;
  final VoidCallback onNext;

  @override
  State<PrecisePronunciationFeedback> createState() =>
      _PrecisePronunciationFeedbackState();
}

class _PrecisePronunciationFeedbackState
    extends State<PrecisePronunciationFeedback>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scores = widget.scores;
    final overall = scores.overall;

    return FadeTransition(
      opacity: _fadeAnim,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          _FeedbackHeader(
            soundLabel: widget.soundLabel,
            overallScore: overall,
            attempt: widget.attempt,
          ),
          const SizedBox(height: 16),

          // Per-dimension scores
          _DimensionRow(
            label: 'ตำแหน่งลิ้น',
            icon: Icons.arrow_upward_rounded,
            score: scores.tonguePosition,
            feedback: _FeedbackCopy.tonguePosition(scores.tonguePosition),
          ),
          _DimensionRow(
            label: 'รูปริมฝีปาก',
            icon: Icons.face_rounded,
            score: scores.lipShape,
            feedback: _FeedbackCopy.lipShape(scores.lipShape),
          ),
          _DimensionRow(
            label: 'การใช้ฟัน',
            icon: Icons.drag_indicator_rounded,
            score: scores.teethUsage,
            feedback: _FeedbackCopy.teethUsage(scores.teethUsage),
          ),
          _DimensionRow(
            label: 'ความชัดเจน',
            icon: Icons.volume_up_rounded,
            score: scores.clarity,
            feedback: _FeedbackCopy.clarity(scores.clarity),
          ),
          _DimensionRow(
            label: 'จังหวะ',
            icon: Icons.music_note_rounded,
            score: scores.rhythm,
            feedback: _FeedbackCopy.rhythm(scores.rhythm),
          ),
          const SizedBox(height: 12),

          // Main improvement tip
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF1A73E8).withOpacity(0.07),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: const Color(0xFF1A73E8).withOpacity(0.25)),
            ),
            child: Text(
              _FeedbackCopy.mainTip(scores),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: const Color(0xFF1A73E8),
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const SizedBox(height: 20),

          // Action buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: widget.onTryAgain,
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('ลองอีกครั้ง'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: widget.onNext,
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: Text(overall >= 70 ? 'ถัดไป ✓' : 'ข้ามไปก่อน'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Header ────────────────────────────────────────────────────────────────

class _FeedbackHeader extends StatelessWidget {
  const _FeedbackHeader({
    required this.soundLabel,
    required this.overallScore,
    required this.attempt,
  });

  final String soundLabel;
  final int overallScore;
  final int attempt;

  @override
  Widget build(BuildContext context) {
    final Color scoreColor;
    final String headline;

    if (overallScore >= 85) {
      scoreColor = const Color(0xFF34A853);
      headline = 'ยอดเยี่ยมมากเลย! 🏆';
    } else if (overallScore >= 70) {
      scoreColor = const Color(0xFF34A853);
      headline = 'ดีมาก! เกือบสมบูรณ์แบบแล้ว 🌟';
    } else if (overallScore >= 55) {
      scoreColor = const Color(0xFFFBBC04);
      headline = 'ดีขึ้นมาก! ฝึกต่อไปนะ 💪';
    } else {
      scoreColor = const Color(0xFFE8710A);
      headline = 'เริ่มต้นได้ดี! ค่อยๆ ฝึกไป 🌱';
    }

    return Row(
      children: [
        // Score circle
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: scoreColor, width: 3),
            color: scoreColor.withOpacity(0.08),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$overallScore',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: scoreColor,
                  ),
                ),
                Text(
                  'คะแนน',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 10,
                    color: scoreColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headline,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: scoreColor,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                '$soundLabel • ครั้งที่ $attempt',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Dimension row ─────────────────────────────────────────────────────────

class _DimensionRow extends StatefulWidget {
  const _DimensionRow({
    required this.label,
    required this.icon,
    required this.score,
    required this.feedback,
  });

  final String label;
  final IconData icon;
  final int score;
  final String feedback;

  @override
  State<_DimensionRow> createState() => _DimensionRowState();
}

class _DimensionRowState extends State<_DimensionRow>
    with SingleTickerProviderStateMixin {
  late AnimationController _barController;
  late Animation<double> _barAnim;
  bool _showFeedback = false;

  @override
  void initState() {
    super.initState();
    _barController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();
    _barAnim =
        CurvedAnimation(parent: _barController, curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    _barController.dispose();
    super.dispose();
  }

  Color get _color {
    if (widget.score >= 75) return const Color(0xFF34A853);
    if (widget.score >= 55) return const Color(0xFFFBBC04);
    return const Color(0xFFEA4335);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () => setState(() => _showFeedback = !_showFeedback),
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(widget.icon, color: _color, size: 18),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        widget.label,
                        style:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                    // Animated score bar
                    SizedBox(
                      width: 100,
                      child: AnimatedBuilder(
                        animation: _barAnim,
                        builder: (_, __) => ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: (widget.score / 100) * _barAnim.value,
                            minHeight: 8,
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            color: _color,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 36,
                      child: Text(
                        '${widget.score}%',
                        style: TextStyle(
                          fontFamily: 'Kanit',
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: _color,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      _showFeedback
                          ? Icons.expand_less_rounded
                          : Icons.expand_more_rounded,
                      size: 18,
                      color: const Color(0xFF9AA0A6),
                    ),
                  ],
                ),
                if (_showFeedback) ...[
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.feedback,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: _color.withOpacity(0.9),
                            height: 1.5,
                          ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
