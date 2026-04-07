import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'home_data.dart';

part 'home_repository.g.dart';

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepository(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  );
}

class HomeRepository {
  HomeRepository({required this.firestore, required this.auth});

  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  String get _uid => auth.currentUser!.uid;

  Stream<HomeData?> watchHomeData() {
    return firestore
        .doc('users/$_uid/derived/home')
        .snapshots()
        .map((snap) {
      if (!snap.exists || snap.data() == null) return null;
      return HomeData.fromJson(snap.data()!);
    });
  }
}
