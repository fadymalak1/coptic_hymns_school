import 'package:coptic_hymns_school/shared/models/course_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseDetailsMobile extends ConsumerWidget {
  const CourseDetailsMobile({Key? key, required this.course}) : super(key: key);
  final CourseDetails course;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text('Course Details Mobile'),
    );
  }
}