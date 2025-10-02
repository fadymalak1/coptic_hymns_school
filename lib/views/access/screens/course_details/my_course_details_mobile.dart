import 'package:coptic_hymns_school/shared/models/enrolled_courses.dart';
import 'package:coptic_hymns_school/views/access/screens/course_details/widgets/my_course_details_widget.dart';
import 'package:flutter/material.dart';

class MyCourseDetailsMobile extends StatelessWidget {
  const MyCourseDetailsMobile({super.key, required this.course});
  final Enrollment course;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(child: MyCourseDetailsWidget(courseDetails: course)),
          Expanded(flex:2,child: MyCourseDetailsWidget(courseDetails: course)),
        ]
    );
  }
}
