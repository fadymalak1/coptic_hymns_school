import 'package:coptic_hymns_school/shared/models/enrolled_courses.dart';
import 'package:coptic_hymns_school/views/access/service/access_service.dart';

class AccessRepository {
  final AccessService accessService;

  AccessRepository({required this.accessService});

  Future<List<Enrollment>> getCourses(String email) async {
    final response = await accessService.getCourses(email);

    if (response['status'] == 'success' && (response['data'] as List).isNotEmpty) {
      final list = (response['data'] as List)
          .map((e) => Enrollment.fromJson(e))
          .toList();
      return list;
    } else {
      return [];
    }
  }

  Future<Map<String, dynamic>> rateCourse(int courseId, int rating, String email) async {
    final response = await accessService.rateCourse(courseId, rating, email);
    return response;
  }

}
