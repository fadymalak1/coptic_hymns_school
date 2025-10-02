import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/enrolled_courses.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
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
  Widget build(BuildContext context,WidgetRef ref) {
    final color = ref.watch(primaryColorProvider);
    final translate = AppLocalizations.of(context)!;
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
                    Card(
                      elevation: 2,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Text(
                              "Rate this course",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            RatingBar(
                              filledIcon: Icons.star,
                              emptyIcon: Icons.star_border,
                              onRatingChanged: (value) {},
                              isHalfAllowed: false,
                              initialRating: 3,
                              maxRating: 5,
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                backgroundColor: color,
                                foregroundColor: Colors.white,
                                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                                onPressed: () {},
                          child: Text("Rate"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: course.course.videos.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return VideoWidget(video: course.course.videos[index]);
                      },
                    ),
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
