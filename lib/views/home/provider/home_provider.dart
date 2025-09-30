import 'dart:ui';

import 'package:coptic_hymns_school/shared/models/app_data.dart';
import 'package:coptic_hymns_school/shared/models/app_settings.dart';
import 'package:coptic_hymns_school/shared/models/course.dart';
import 'package:coptic_hymns_school/shared/models/information.dart';
import 'package:coptic_hymns_school/shared/models/instructor.dart';
import 'package:coptic_hymns_school/views/home/repository/home_repository.dart';
import 'package:coptic_hymns_school/views/home/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../shared/providers/api_provider.dart';


// ✅ Provider للتاب المختار
final selectedTabProvider = StateProvider<int>((ref) => 0);

final homeServiceProvider = Provider<HomeService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return HomeService(apiService);
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final homeService = ref.watch(homeServiceProvider);
  return HomeRepository(homeService);
});

final informationProvider = FutureProvider<Information>((ref) async {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return homeRepository.fetchInformation();
});



Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

final primaryColorProvider = StateProvider<Color>((ref) {
  // default fallback color
  return Colors.teal;
});


final instructorProvider = FutureProvider<Instructor>((ref) async {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return homeRepository.fetchInstructor();
});


final layoutDataProvider = FutureProvider<AppData>((ref) async {
  final homeRepository = ref.watch(homeRepositoryProvider);
  final results = await Future.wait([
    homeRepository.fetchInformation(),
    homeRepository.fetchAppSetting(),
    homeRepository.fetchInstructor(),
    homeRepository.fetchCourses(),
  ]);

  AppSetting appSetting = results[1] as AppSetting;

  // ✅ Use read instead of watch to prevent infinite loop
  ref.read(primaryColorProvider.notifier).state = hexToColor(appSetting.color);

  return AppData(
    information: results[0] as Information,
    appSettings: appSetting,
    instructor: results[2] as Instructor,
    // courses: []
    courses: results[3] as List<Course>,
  );
});
