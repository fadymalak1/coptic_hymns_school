import 'package:coptic_hymns_school/shared/models/enrolled_courses.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'my_course_details_desktop.dart';
import 'my_course_details_mobile.dart';

class MyCourseDetails extends StatelessWidget {
  const MyCourseDetails({super.key, required this.course});
  final Enrollment course;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MyCourseDetailsMobile(course: course),
      desktop: MyCourseDetailsDesktop(course: course),
    );
  }
}
