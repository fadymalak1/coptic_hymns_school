import 'package:coptic_hymns_school/shared/models/enrolled_courses.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'my_courses_section_desktop.dart';
import 'my_courses_section_mobile.dart';
import 'my_courses_section_tablet.dart';

class MyCourses extends StatelessWidget {
  const MyCourses({super.key, required this.enrollments});
  final List<Enrollment> enrollments;


  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile:  MyCoursesMobile(courses: enrollments,),
      desktop:  MyCoursesDesktop(courses: enrollments,),
      tablet:  MyCoursesTablet(courses: enrollments,),
    );
  }
}
