import 'package:coptic_hymns_school/shared/models/enrolled_courses.dart';
import 'package:coptic_hymns_school/views/access/screens/course_details/widgets/my_course_details_widget.dart';
import 'package:coptic_hymns_school/views/access/screens/course_details/widgets/video_widget.dart';
import 'package:flutter/material.dart';

class MyCourseDetailsMobile extends StatelessWidget {
  const MyCourseDetailsMobile({super.key, required this.course});

  final Enrollment course;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyCourseDetailsWidget(courseDetails: course),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  for (var video in course.course.videos) ...[
                    VideoWidget(video: video),
                    const SizedBox(height: 12),
                  ],
                ],
              ),
            ),
      
          ],
        ),
      ),
    );
  }
}
