import 'package:coptic_hymns_school/shared/models/app_settings.dart';
import 'package:coptic_hymns_school/shared/models/information.dart';
import 'package:coptic_hymns_school/shared/services/api_service.dart';
import 'package:coptic_hymns_school/shared/utils/api.dart';

class HomeService {
  final ApiService _apiService;
  HomeService(this._apiService);

  Future<Map<String, dynamic>> fetchInformation() async {
    try {
      final response = await _apiService.get(ApiConstants.informationEndpoint);
      return response.data['data'];
    }
    catch (e) {
      throw Exception('Failed to fetch information: $e');
    }
  }

  Future<Map<String, dynamic>> fetchAppSetting() async {
    final response = await _apiService.get(ApiConstants.settingsEndpoint);
    return response.data['data'];
  }

  Future<Map<String, dynamic>> fetchInstructor() async {
    final response = await _apiService.get(ApiConstants.instructorsEndpoint);
    return response.data['data'];
  }

  Future<List<Map<String, dynamic>>> fetchCourses() async {
    final response = await _apiService.get(ApiConstants.coursesEndpoint);
    final List<dynamic> data = response.data['data'];
    return data.cast<Map<String, dynamic>>();
  }


}