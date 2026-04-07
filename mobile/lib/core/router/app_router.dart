import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/application/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/signup_screen.dart';
import '../../features/dialogue/presentation/screens/dialogue_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/lesson/presentation/screens/lesson_player_screen.dart';
import '../../features/lesson/presentation/screens/lesson_intro_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/onboarding/presentation/screens/splash_screen.dart';
import '../../features/progress/presentation/screens/progress_screen.dart';
import '../../features/review/presentation/screens/review_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/sounds/presentation/screens/sound_detail_screen.dart';
import '../../shared/widgets/main_shell.dart';

part 'app_router.g.dart';

/// Route path constants
abstract class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const progress = '/progress';
  static const review = '/review';
  static const settings = '/settings';
  static const lessonIntro = '/lesson/:lessonId';
  static const lessonPlayer = '/lesson/:lessonId/play';
  static const soundDetail = '/sounds/:soundId';
  static const dialogue = '/dialogues/:dialogueId';
}

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull != null;
      final isAuthRoute = state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.signup ||
          state.matchedLocation == AppRoutes.splash;

      if (!isLoggedIn && !isAuthRoute) {
        return AppRoutes.login;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: AppRoutes.progress,
            builder: (context, state) => const ProgressScreen(),
          ),
          GoRoute(
            path: AppRoutes.review,
            builder: (context, state) => const ReviewScreen(),
          ),
          GoRoute(
            path: AppRoutes.settings,
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/lesson/:lessonId',
        builder: (context, state) =>
            LessonIntroScreen(lessonId: state.pathParameters['lessonId']!),
        routes: [
          GoRoute(
            path: 'play',
            builder: (context, state) =>
                LessonPlayerScreen(lessonId: state.pathParameters['lessonId']!),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.soundDetail,
        builder: (context, state) =>
            SoundDetailScreen(soundId: state.pathParameters['soundId']!),
      ),
      GoRoute(
        path: AppRoutes.dialogue,
        builder: (context, state) =>
            DialogueScreen(dialogueId: state.pathParameters['dialogueId']!),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.error}'),
      ),
    ),
  );
}
