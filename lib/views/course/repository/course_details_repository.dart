import 'package:coptic_hymns_school/shared/models/course_details.dart';
import 'package:coptic_hymns_school/views/course/service/course_details_service.dart';

class CourseDetailsRepository {
  final CourseDetailsService _courseDetailsService;
  CourseDetailsRepository(this._courseDetailsService);

  Future<CourseDetails> getCourseDetails(int courseId) async {
    final data = await _courseDetailsService.getCourseDetails(courseId);
    return CourseDetails.fromJson(data);
  }
}