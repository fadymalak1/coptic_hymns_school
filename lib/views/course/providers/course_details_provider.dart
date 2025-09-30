

import 'package:coptic_hymns_school/shared/models/course_details.dart';
import 'package:coptic_hymns_school/shared/providers/api_provider.dart';
import 'package:coptic_hymns_school/views/course/repository/course_details_repository.dart';
import 'package:coptic_hymns_school/views/course/service/course_details_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'package:coptic_hymns_school/shared/models/course_details.dart';
import 'package:coptic_hymns_school/shared/providers/api_provider.dart';
import 'package:coptic_hymns_school/views/course/repository/course_details_repository.dart';
import 'package:coptic_hymns_school/views/course/service/course_details_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final courseDetailsServiceProvider = Provider<CourseDetailsService>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return CourseDetailsService(apiService);
});

final courseDetailsRepositoryProvider = Provider<CourseDetailsRepository>((ref) {
  final service = ref.watch(courseDetailsServiceProvider);
  return CourseDetailsRepository(service);
});

// FutureProvider.family عشان نستقبل courseId
final courseDetailsProvider = FutureProvider.family<CourseDetails, int>((ref, courseId) async {
  final repository = ref.watch(courseDetailsRepositoryProvider);
  return repository.getCourseDetails(courseId);
});
