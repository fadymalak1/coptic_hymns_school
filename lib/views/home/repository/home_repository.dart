import 'package:coptic_hymns_school/shared/models/app_settings.dart';
import 'package:coptic_hymns_school/shared/models/course.dart';
import 'package:coptic_hymns_school/shared/models/information.dart';
import 'package:coptic_hymns_school/shared/models/instructor.dart';
import 'package:coptic_hymns_school/views/home/service/home_service.dart';

class HomeRepository {
  final HomeService _homeService;
  HomeRepository(this._homeService);

  Future<Information> fetchInformation() async {
    try {
      final response = await _homeService.fetchInformation();
      return Information.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch information: $e');
    }
  }

  Future<AppSetting> fetchAppSetting() async {
    try {
      final response = await _homeService.fetchAppSetting();
      return AppSetting.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch app setting: $e');
    }
  }

  Future<Instructor> fetchInstructor() async {
    try {
      final response = await _homeService.fetchInstructor();
      return Instructor.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch instructor: $e');
    }
  }
  Future<List<Course>> fetchCourses() async {
    try {
      final response = await _homeService.fetchCourses();
      return response.map((course) => Course.fromJson(course)).toList();
    } catch (e) {
      throw Exception('Failed to fetch courses: $e');
    }
  }
}