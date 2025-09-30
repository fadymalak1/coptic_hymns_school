import 'package:coptic_hymns_school/shared/models/course_details.dart';
import 'package:coptic_hymns_school/shared/services/api_service.dart';

class CourseDetailsService {
  final ApiService _apiService;
  CourseDetailsService(this._apiService);

  Future<Map<String, dynamic>> getCourseDetails(int courseId) async {
    final response = await _apiService.get('/courses/$courseId');
    return response.data['data'];
  }
}