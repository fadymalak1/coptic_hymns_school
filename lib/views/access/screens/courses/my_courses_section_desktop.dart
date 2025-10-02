import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/enrolled_courses.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/views/access/screens/courses/widgets/my_course_card.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MyCoursesDesktop extends ConsumerWidget {
  const MyCoursesDesktop({super.key, required this.courses});
  final List<Enrollment> courses;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = AppLocalizations.of(context)!;
    final color = ref.watch(primaryColorProvider);
    return Container(
      color: Colors.white,
      child: CenteredView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            shrinkWrap: true, // let it size itself
            physics: const NeverScrollableScrollPhysics(), // prevent nested scroll issues
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.95,
            ),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return MyCourseCard(course: courses[index]);
            },
          ),
        ),
      ),
    );
  }
}
