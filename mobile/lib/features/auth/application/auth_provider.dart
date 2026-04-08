import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
Stream<User?> authState(AuthStateRef ref) {
  return FirebaseAuth.instance.authStateChanges();
}

@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@riverpod
class AuthController extends _$AuthController {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> signInAnonymously() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(firebaseAuthProvider).signInAnonymously(),
    );
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(firebaseAuthProvider).signInWithEmailAndPassword(
            email: email,
            password: password,
          ),
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(firebaseAuthProvider).createUserWithEmailAndPassword(
            email: email,
            password: password,
          ),
    );
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(firebaseAuthProvider).signOut(),
    );
  }

  /// Links an anonymous account to email/password, preserving progress.
  Future<void> upgradeGuestAccount({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final user = ref.read(firebaseAuthProvider).currentUser;
    if (user == null) {
      state = AsyncError(
        Exception('No current user to upgrade'),
        StackTrace.current,
      );
      return;
    }
    final credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );
    state = await AsyncValue.guard(
      () => user.linkWithCredential(credential),
    );
  }
}
