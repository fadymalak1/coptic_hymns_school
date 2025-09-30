import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'courses_section_desktop.dart';
import 'courses_section_mobile.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const CoursesSectionMobile(),
      desktop: const CoursesSectionDesktop(),
    );
  }
}
