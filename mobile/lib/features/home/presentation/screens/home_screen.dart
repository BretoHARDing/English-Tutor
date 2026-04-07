import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../application/home_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeAsync = ref.watch(homeDataProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: homeAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('เกิดข้อผิดพลาด: $e')),
        data: (home) => home == null
            ? const _EmptyHomeState()
            : _HomeContent(home: home),
      ),
    );
  }
}

class _EmptyHomeState extends StatelessWidget {
  const _EmptyHomeState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.school_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'กำลังเตรียมบทเรียน...',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({required this.home});

  final dynamic home;

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
            _GreetingHeader(name: home.greetingName),
            const SizedBox(height: 20),
            _SummaryRow(summary: home.summary),
            const SizedBox(height: 24),
            if (home.todayLesson != null) ...[
              _TodayLessonCard(lesson: home.todayLesson!),
              const SizedBox(height: 20),
            ],
            if (home.reviewDue.wordCount +
                    home.reviewDue.soundCount +
                    home.reviewDue.sentenceCount +
                    home.reviewDue.dialogueCount >
                0) ...[
              _ReviewDueCard(reviewDue: home.reviewDue),
              const SizedBox(height: 20),
            ],
            if (home.recommendedPractice != null) ...[
              _RecommendedPracticeCard(practice: home.recommendedPractice!),
              const SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }
}

class _GreetingHeader extends StatelessWidget {
  const _GreetingHeader({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    final greeting = hour < 12
        ? 'อรุณสวัสดิ์'
        : hour < 17
            ? 'สวัสดีตอนบ่าย'
            : 'สวัสดีตอนเย็น';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$greeting, $name 👋',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 4),
        Text(
          'วันนี้เรียนภาษาอังกฤษกันเถอะ',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.summary});
  final dynamic summary;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatChip(
          icon: Icons.check_circle_outline,
          label: '${summary.lessonsCompleted} บทเรียน',
          color: const Color(0xFF34A853),
        ),
        const SizedBox(width: 8),
        _StatChip(
          icon: Icons.translate,
          label: '${summary.wordsLearned} คำศัพท์',
          color: const Color(0xFF1A73E8),
        ),
        const SizedBox(width: 8),
        _StatChip(
          icon: Icons.local_fire_department_outlined,
          label: '${summary.streakDays} วัน',
          color: const Color(0xFFFBBC04),
        ),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: color),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: color, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TodayLessonCard extends StatelessWidget {
  const _TodayLessonCard({required this.lesson});
  final dynamic lesson;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.push('/lesson/${lesson.id}'),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'บทเรียนวันนี้',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    '${lesson.estimatedMinutes} นาที',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                lesson.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: lesson.progressPercent / 100,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.push('/lesson/${lesson.id}'),
                child: Text(lesson.cta == 'start' ? 'เริ่มเรียน' : 'เรียนต่อ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReviewDueCard extends StatelessWidget {
  const _ReviewDueCard({required this.reviewDue});
  final dynamic reviewDue;

  @override
  Widget build(BuildContext context) {
    final total = reviewDue.wordCount +
        reviewDue.soundCount +
        reviewDue.sentenceCount +
        reviewDue.dialogueCount;

    return Card(
      child: InkWell(
        onTap: () => context.push(AppRoutes.review),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .secondary
                      .withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.replay_rounded,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ทบทวนรอดำเนินการ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '$total รายการ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecommendedPracticeCard extends StatelessWidget {
  const _RecommendedPracticeCard({required this.practice});
  final dynamic practice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'แนะนำให้ฝึก',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              practice.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {},
              child: const Text('ฝึกเลย'),
            ),
          ],
        ),
      ),
    );
  }
}
