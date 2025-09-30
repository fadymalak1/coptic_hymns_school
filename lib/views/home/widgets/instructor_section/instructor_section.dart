import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'instructor_section_desktop.dart';
import 'instructor_section_mobile.dart';

class InstructorSectionWidget extends ConsumerWidget {
  const InstructorSectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenTypeLayout(
      mobile: const InstructorSectionMobile(),
      desktop: const InstructorSectionDesktop(),
    );
  }
}