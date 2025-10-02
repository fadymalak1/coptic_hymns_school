import 'package:coptic_hymns_school/shared/providers/api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coptic_hymns_school/shared/models/enrolled_courses.dart';
import 'package:coptic_hymns_school/views/access/service/access_service.dart';
import 'package:coptic_hymns_school/views/access/repository/access_repository.dart';
import 'package:coptic_hymns_school/shared/services/api_service.dart';
import 'package:flutter_riverpod/legacy.dart';


final accessServiceProvider = Provider(
      (ref) => AccessService(apiService: ref.read(apiServiceProvider)),
);

final accessRepositoryProvider = Provider(
      (ref) => AccessRepository(accessService: ref.read(accessServiceProvider)),
);

// FutureProvider.family so we can pass email dynamically
final coursesProvider = FutureProvider.family<List<Enrollment>, String>((ref, email) async {
  final repo = ref.read(accessRepositoryProvider);
  return repo.getCourses(email);
});

final accessLoadingProvider = StateProvider<bool>((ref) => false);
