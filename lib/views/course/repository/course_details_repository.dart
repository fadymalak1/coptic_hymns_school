import 'package:coptic_hymns_school/shared/models/course_details.dart';
import 'package:coptic_hymns_school/shared/models/enrollment_response.dart';
import 'package:coptic_hymns_school/views/course/service/course_details_service.dart';

class CourseDetailsRepository {
  final CourseDetailsService _courseDetailsService;
  CourseDetailsRepository(this._courseDetailsService);

  Future<CourseDetails> getCourseDetails(int courseId) async {
    final data = await _courseDetailsService.getCourseDetails(courseId);
    return CourseDetails.fromJson(data);
  }

  Future<EnrolmentResponse> enrollCourse(int courseId, String name, String email, String phone) async {
    final data = await _courseDetailsService.enrollCourse(courseId, name, email, phone);
    return EnrolmentResponse.fromJson(data);
  }
}