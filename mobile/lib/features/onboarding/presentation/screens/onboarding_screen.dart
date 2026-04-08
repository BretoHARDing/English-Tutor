import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  String? _selectedGoal;
  String? _name;

  final List<String> _goals = [
    'daily_life',
    'home_conversation',
    'travel',
    'start_from_zero',
  ];

  final Map<String, String> _goalLabels = {
    'daily_life': 'ชีวิตประจำวัน',
    'home_conversation': 'สนทนาในบ้าน',
    'travel': 'ท่องเที่ยว',
    'start_from_zero': 'เริ่มต้นจากศูนย์',
  };

  final Map<String, IconData> _goalIcons = {
    'daily_life': Icons.wb_sunny_outlined,
    'home_conversation': Icons.home_outlined,
    'travel': Icons.flight_outlined,
    'start_from_zero': Icons.school_outlined,
  };

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(AppRoutes.home);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LinearProgressIndicator(
              value: (_currentPage + 1) / 3,
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => _currentPage = i),
                children: [
                  _GoalSelectionPage(
                    goals: _goals,
                    goalLabels: _goalLabels,
                    goalIcons: _goalIcons,
                    selectedGoal: _selectedGoal,
                    onSelected: (goal) => setState(() => _selectedGoal = goal),
                  ),
                  _NameInputPage(
                    onNameSaved: (name) => setState(() => _name = name),
                  ),
                  _WelcomePage(name: _name ?? ''),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: (_currentPage == 0 && _selectedGoal == null)
                    ? null
                    : _nextPage,
                child: Text(_currentPage < 2 ? 'ถัดไป' : 'เริ่มเรียน!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoalSelectionPage extends StatelessWidget {
  const _GoalSelectionPage({
    required this.goals,
    required this.goalLabels,
    required this.goalIcons,
    required this.selectedGoal,
    required this.onSelected,
  });

  final List<String> goals;
  final Map<String, String> goalLabels;
  final Map<String, IconData> goalIcons;
  final String? selectedGoal;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'คุณต้องการเรียนภาษาอังกฤษ\nเพื่ออะไร?',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 32),
          ...goals.map(
            (goal) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _GoalCard(
                label: goalLabels[goal]!,
                icon: goalIcons[goal]!,
                isSelected: selectedGoal == goal,
                onTap: () => onSelected(goal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : const Color(0xFFDADCE0),
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : const Color(0xFF5F6368),
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NameInputPage extends StatefulWidget {
  const _NameInputPage({required this.onNameSaved});
  final ValueChanged<String> onNameSaved;

  @override
  State<_NameInputPage> createState() => _NameInputPageState();
}

class _NameInputPageState extends State<_NameInputPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'คุณชื่ออะไร?',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'เราจะใช้ชื่อนี้ในการสนทนา',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 32),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'ชื่อเล่น',
              hintText: 'เช่น มะลิ',
            ),
            textCapitalization: TextCapitalization.words,
            onChanged: widget.onNameSaved,
          ),
        ],
      ),
    );
  }
}

class _WelcomePage extends StatelessWidget {
  const _WelcomePage({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.celebration_outlined,
            size: 80,
            color: Color(0xFF1A73E8),
          ),
          const SizedBox(height: 24),
          Text(
            name.isEmpty ? 'ยินดีต้อนรับ!' : 'ยินดีต้อนรับ, $name!',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'พร้อมเริ่มเรียนภาษาอังกฤษแล้ว\nเรามาเริ่มกันเลย!',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
