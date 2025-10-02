import 'package:coptic_hymns_school/shared/services/api_service.dart';
import 'package:coptic_hymns_school/shared/utils/api.dart';

class AccessService {
  final ApiService apiService;

  AccessService({required this.apiService});

  Future<Map<String, dynamic>> getCourses(String email) async {
    final response = await apiService.get("${ApiConstants.getCoursesEndpoint}/$email");
    return response.data as Map<String, dynamic>;
  }
}
