import 'package:coptic_hymns_school/shared/models/course_details.dart';
import 'package:coptic_hymns_school/shared/services/api_service.dart';
import 'package:coptic_hymns_school/shared/utils/api.dart';

class CourseDetailsService {
  final ApiService _apiService;

  CourseDetailsService(this._apiService);

  Future<Map<String, dynamic>> getCourseDetails(int courseId) async {
    final response = await _apiService.get('/courses/$courseId');
    return response.data['data'];
  }

  Future<Map<String, dynamic>> enrollCourse(
    int courseId,
    String name,
    String email,
    String phone,
  ) async {
    final response = await _apiService.post(
      ApiConstants.registerEndpoint,
      data: {
        'course_id': courseId,
        'name': name,
        'email': email,
        'phone': phone,
      },
    );
    return response.data;
  }
}
