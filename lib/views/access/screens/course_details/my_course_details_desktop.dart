// my_course_details_desktop.dart

import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/enrolled_courses.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/shared/widgets/custom_snack_bar.dart';
import 'package:coptic_hymns_school/views/access/providers/access_provider.dart';
import 'package:coptic_hymns_school/views/access/screens/course_details/widgets/my_course_details_widget.dart';
import 'package:coptic_hymns_school/views/access/screens/course_details/widgets/video_widget.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCourseDetailsDesktop extends ConsumerWidget {
  const MyCourseDetailsDesktop({super.key, required this.course});

  final Enrollment course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(primaryColorProvider);
    final translate = AppLocalizations.of(context)!;
    // final email = ref.watch(emailProvider);
    // final currentRating = ref.watch(ratingValueProvider);
    // final isRating = ref.watch(isRatingProvider);

    return SingleChildScrollView(
      child: CenteredView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: MyCourseDetailsWidget(courseDetails: course)),
            Expanded(
              flex: 2,
              child: Padding(
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
            ),

          ],
        ),
      ),
    );
  }
}