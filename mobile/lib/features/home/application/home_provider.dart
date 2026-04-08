import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/home_data.dart';
import '../data/home_repository.dart';

part 'home_provider.g.dart';

@riverpod
Stream<HomeData?> homeData(HomeDataRef ref) {
  return ref.watch(homeRepositoryProvider).watchHomeData();
}
