import 'app_settings.dart';
import 'course.dart';
import 'information.dart';
import 'instructor.dart';

class AppData{
  final AppSetting appSettings;
  final Information information;
  final Instructor instructor;
  final List<Course> courses;

  AppData({
    required this.appSettings,
    required this.information,
    required this.instructor,
    required this.courses,
  });
}