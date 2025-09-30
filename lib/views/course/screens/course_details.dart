import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/utils/animations.dart';
import 'package:coptic_hymns_school/views/course/providers/course_details_provider.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'course_details_desktop.dart';
import 'course_details_mobile.dart';

class CourseDetails extends ConsumerWidget {
  final int courseId;

  const CourseDetails({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = AppLocalizations.of(context)!;
    final color = ref.watch(primaryColorProvider);
    final courseDetailsAsync = ref.watch(courseDetailsProvider(courseId));

    return courseDetailsAsync.when(
      data: (course) {
        return Scaffold(
          body: Center(
            child: ScreenTypeLayout(
              mobile: CourseDetailsMobile(course: course),
              desktop: CourseDetailsDesktop(course: course),
            ),
          ),
        );
      },
      loading: () => Center(
        child: Lottie.asset(
          Animations.loadingAnimation,
          width: 150,
          height: 150,
          repeat: true,
        ),
      ),
      error: (err, stack) => Text("Error: $err"),
    );
  }
}
