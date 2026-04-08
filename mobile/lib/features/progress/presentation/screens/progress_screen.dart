import 'package:flutter/material.dart';

import '../../../../shared/widgets/feedback_widgets.dart';

/// Progress dashboard.
/// Reads from users/{uid}/derived/progress via Firestore when wired up;
/// until then it shows a demo state so the UX is visible.
class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ความก้าวหน้า')),
      body: const _ProgressBody(),
    );
  }
}

// ── Body ──────────────────────────────────────────────────────────────────

class _ProgressBody extends StatelessWidget {
  const _ProgressBody();

  // Demo values — in production these come from derived/progress + streak/current
  static const int _streakDays = 7;
  static const int _lessonsCompleted = 12;
  static const int _wordsLearned = 84;
  static const int _reviewsCompleted = 43;
  static const int _dialoguesCompleted = 5;
  static const int _coursePercent = 24;

  // Weekly activity (Sun → Sat).
  static const _weekValues = [3, 5, 2, 4, 6, 1, 7];
  static const _weekLabels = ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส'];

  // Weak sounds demo
  static const _weakSounds = [
    _WeakSoundData(label: 'th (คำว่า "the")', score: 38),
    _WeakSoundData(label: 'v (คำว่า "very")', score: 45),
    _WeakSoundData(label: 'r (คำว่า "right")', score: 52),
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Streak banner
            StreakBanner(streakDays: _streakDays),
            const SizedBox(height: 24),

            // Course progress
            _SectionTitle(title: 'ความก้าวหน้าคอร์ส'),
            const SizedBox(height: 12),
            _CourseProgressBar(percent: _coursePercent),
            const SizedBox(height: 24),

            // Stats grid
            _SectionTitle(title: 'สถิติของคุณ'),
            const SizedBox(height: 12),
            _StatsGrid(
              lessonsCompleted: _lessonsCompleted,
              wordsLearned: _wordsLearned,
              reviewsCompleted: _reviewsCompleted,
              dialoguesCompleted: _dialoguesCompleted,
            ),
            const SizedBox(height: 24),

            // Weekly activity
            _SectionTitle(title: 'กิจกรรมสัปดาห์นี้'),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: WeeklyBarChart(
                  dayLabels: _weekLabels,
                  values: _weekValues,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Pronunciation trend title + tip
            _SectionTitle(title: 'เสียงที่ต้องฝึกเพิ่ม'),
            const SizedBox(height: 12),
            ..._weakSounds.map((s) => _WeakSoundTile(data: s)),
            const SizedBox(height: 12),

            // Motivational footer
            _MotivationCard(streakDays: _streakDays),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// ── Sub-widgets ───────────────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
    );
  }
}

class _CourseProgressBar extends StatelessWidget {
  const _CourseProgressBar({required this.percent});
  final int percent;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'คอร์สภาษาอังกฤษพื้นฐาน',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '$percent%',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: percent / 100,
                minHeight: 10,
                backgroundColor: Theme.of(context).colorScheme.surface,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              percent < 100
                  ? 'เรียนต่อไป คุณทำได้! 💪'
                  : 'ยอดเยี่ยม! คุณเรียนจบแล้ว! 🎓',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  const _StatsGrid({
    required this.lessonsCompleted,
    required this.wordsLearned,
    required this.reviewsCompleted,
    required this.dialoguesCompleted,
  });

  final int lessonsCompleted;
  final int wordsLearned;
  final int reviewsCompleted;
  final int dialoguesCompleted;

  @override
  Widget build(BuildContext context) {
    final stats = [
      (
        icon: Icons.menu_book_rounded,
        value: '$lessonsCompleted',
        label: 'บทเรียน',
        color: const Color(0xFF1A73E8),
      ),
      (
        icon: Icons.translate_rounded,
        value: '$wordsLearned',
        label: 'คำศัพท์',
        color: const Color(0xFF34A853),
      ),
      (
        icon: Icons.replay_rounded,
        value: '$reviewsCompleted',
        label: 'ทบทวน',
        color: const Color(0xFFE8710A),
      ),
      (
        icon: Icons.record_voice_over_rounded,
        value: '$dialoguesCompleted',
        label: 'บทสนทนา',
        color: const Color(0xFF9C27B0),
      ),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.4,
      children: stats
          .map((s) => StatCard(
                icon: s.icon,
                value: s.value,
                label: s.label,
                color: s.color,
              ))
          .toList(),
    );
  }
}

class _WeakSoundData {
  const _WeakSoundData({required this.label, required this.score});
  final String label;
  final int score;
}

class _WeakSoundTile extends StatelessWidget {
  const _WeakSoundTile({required this.data});
  final _WeakSoundData data;

  @override
  Widget build(BuildContext context) {
    final Color scoreColor = data.score < 50
        ? const Color(0xFFEA4335)
        : const Color(0xFFFBBC04);

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(Icons.volume_up_rounded, color: scoreColor, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.label,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: data.score / 100,
                      minHeight: 6,
                      backgroundColor:
                          Theme.of(context).colorScheme.surface,
                      color: scoreColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${data.score}%',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: scoreColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MotivationCard extends StatelessWidget {
  const _MotivationCard({required this.streakDays});
  final int streakDays;

  @override
  Widget build(BuildContext context) {
    final String message;
    final IconData icon;

    if (streakDays >= 30) {
      message = 'คุณเป็นนักเรียนที่สม่ำเสมอมาก! รักษาไว้นะ 🏆';
      icon = Icons.emoji_events_rounded;
    } else if (streakDays >= 7) {
      message = 'สัปดาห์แรกผ่านไปแล้ว! คุณกำลังสร้างนิสัยที่ดี 💪';
      icon = Icons.trending_up_rounded;
    } else if (streakDays >= 1) {
      message = 'เยี่ยมมาก! เรียนทุกวันจะช่วยให้คุณก้าวหน้าเร็วขึ้น 🌱';
      icon = Icons.lightbulb_outline_rounded;
    } else {
      message = 'เริ่มเรียนวันนี้เพื่อสร้างสตรีคแรกของคุณ! 🚀';
      icon = Icons.rocket_launch_rounded;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
