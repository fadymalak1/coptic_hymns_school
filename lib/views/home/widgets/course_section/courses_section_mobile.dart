import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:coptic_hymns_school/views/home/widgets/course_section/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoursesSectionMobile extends ConsumerWidget {
  const CoursesSectionMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = AppLocalizations.of(context)!;
    final color = ref.watch(primaryColorProvider);
    final courses = ref.read(layoutDataProvider).value!.courses;

    return Container(
      color: color.withOpacity(0.1),
      child: CenteredView(
        horizontalPadding: 30,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text(
              translate.coptic_hymns_courses,
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
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return CourseCard(course: courses[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
