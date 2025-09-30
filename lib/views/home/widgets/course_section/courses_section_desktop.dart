import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'course_card.dart';

class CoursesSectionDesktop extends ConsumerWidget {
  const CoursesSectionDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = AppLocalizations.of(context)!;
    final color = ref.watch(primaryColorProvider);
    final courses = ref.read(layoutDataProvider).value!.courses;
    return Container(
      color: color.withOpacity(0.1),
      child: CenteredView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text(translate.coptic_hymns_courses, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: color,),),
              SizedBox(height: 20,),
              GridView.builder(
                shrinkWrap: true, // let it size itself
                physics: const NeverScrollableScrollPhysics(), // prevent nested scroll issues
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.9,
                ),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return CourseCard(course: courses[index]);
                },
              ),

            ]
          ),
        ),
      ),
    );
  }
}
