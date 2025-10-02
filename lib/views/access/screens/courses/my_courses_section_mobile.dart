import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/enrolled_courses.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/views/access/screens/courses/my_course_card.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCoursesMobile extends ConsumerWidget {
  const MyCoursesMobile({super.key, required this.courses});
  final List<Enrollment> courses;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = AppLocalizations.of(context)!;
    final color = ref.watch(primaryColorProvider);

    return Container(
      color: color.withOpacity(0.1),
      child: CenteredView(
        horizontalPadding: 30,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text(
              translate.my_courses,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: color,
              ),
            ),
            const SizedBox(height: 16),

            // Mobile: Just stack the cards in a ListView
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courses.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return MyCourseCard(course: courses[index]);
              },
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
