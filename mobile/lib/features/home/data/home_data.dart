import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_data.freezed.dart';
part 'home_data.g.dart';

@freezed
class TodayLesson with _$TodayLesson {
  const factory TodayLesson({
    required String id,
    required String title,
    required int estimatedMinutes,
    required int progressPercent,
    required String cta,
  }) = _TodayLesson;

  factory TodayLesson.fromJson(Map<String, dynamic> json) =>
      _$TodayLessonFromJson(json);
}

@freezed
class ReviewDue with _$ReviewDue {
  const factory ReviewDue({
    @Default(0) int wordCount,
    @Default(0) int soundCount,
    @Default(0) int sentenceCount,
    @Default(0) int dialogueCount,
  }) = _ReviewDue;

  factory ReviewDue.fromJson(Map<String, dynamic> json) =>
      _$ReviewDueFromJson(json);
}

@freezed
class RecommendedPractice with _$RecommendedPractice {
  const factory RecommendedPractice({
    required String type,
    required String targetId,
    required String title,
  }) = _RecommendedPractice;

  factory RecommendedPractice.fromJson(Map<String, dynamic> json) =>
      _$RecommendedPracticeFromJson(json);
}

@freezed
class HomeSummary with _$HomeSummary {
  const factory HomeSummary({
    @Default(0) int lessonsCompleted,
    @Default(0) int wordsLearned,
    @Default(0) int streakDays,
  }) = _HomeSummary;

  factory HomeSummary.fromJson(Map<String, dynamic> json) =>
      _$HomeSummaryFromJson(json);
}

@freezed
class HomeData with _$HomeData {
  const factory HomeData({
    required String greetingName,
    TodayLesson? todayLesson,
    @Default(ReviewDue()) ReviewDue reviewDue,
    RecommendedPractice? recommendedPractice,
    @Default([]) List<Map<String, dynamic>> recentWords,
    @Default(HomeSummary()) HomeSummary summary,
  }) = _HomeData;

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
}
