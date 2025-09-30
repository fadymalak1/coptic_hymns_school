import 'dart:developer';

import 'package:coptic_hymns_school/main.dart';
import 'package:coptic_hymns_school/shared/models/information.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:coptic_hymns_school/views/home/widgets/course_section/courses_section.dart';
import 'package:coptic_hymns_school/views/home/widgets/hero_section/hero_section.dart';
import 'package:coptic_hymns_school/views/home/widgets/instructor_section/instructor_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final information = ref.read(layoutDataProvider).value!.information;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          HeroSectionWidget(information: information,),
          SizedBox(height: 20,),
          CenteredView(child: const InstructorSectionWidget()),
          SizedBox(height: 20,),
          CoursesSection(key: sectionKey,),
        ],
      ),
    );
  }
}
