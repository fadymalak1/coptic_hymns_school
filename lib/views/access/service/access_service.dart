import 'package:coptic_hymns_school/shared/services/api_service.dart';
import 'package:coptic_hymns_school/shared/utils/api.dart';
import 'package:dio/dio.dart';

class AccessService {
  final ApiService apiService;

  AccessService({required this.apiService});

  Future<Map<String, dynamic>> getCourses(String email) async {
    final response = await apiService.get("${ApiConstants.getCoursesEndpoint}/$email");
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> rateCourse(int courseId, int rating, String email) async {
    try {
      final response = await apiService.post(
        "courses/$courseId/rate",
        data: {'rating': rating, 'email': email},
      );

      return {
        "status": response.statusCode,
        "data": response.data,
      };
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return {
          "status": 400,
          "data": e.response?.data,
        };
      }
      rethrow; // أي error تاني يترمي زي ما هو
    }
  }

}
