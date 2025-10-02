import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/enrolled_courses.dart';
import 'package:coptic_hymns_school/views/access/providers/access_provider.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'my_courses_section_desktop.dart';
import 'my_courses_section_mobile.dart';
import 'my_courses_section_tablet.dart';

class MyCourses extends ConsumerWidget {
  const MyCourses({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(primaryColorProvider);
    final enrollments = ref.watch(myCoursesProvider);
    final translate = AppLocalizations.of(context)!;
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: color.withOpacity(0.1),
              width: double.infinity,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(translate.my_learning_dashboard, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.black,),),
                  SizedBox(height: 20,),
                  Text(translate.my_learning_dashboard_description, style: TextStyle(fontSize: 16, color: color,),textAlign: TextAlign.center,),
                ],
              ),
            ),
            ScreenTypeLayout(
              mobile:  MyCoursesMobile(courses: enrollments,),
              desktop:  MyCoursesDesktop(courses: enrollments,),
              tablet:  MyCoursesTablet(courses: enrollments,),
            ),
          ],
        ),
      ),
    );
  }
}
