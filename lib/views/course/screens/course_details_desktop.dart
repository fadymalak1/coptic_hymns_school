import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/course_details.dart';
import 'package:coptic_hymns_school/views/course/widgets/course_details_widget.dart';
import 'package:coptic_hymns_school/views/course/widgets/register_widget.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CourseDetailsDesktop extends ConsumerWidget {
  const CourseDetailsDesktop({super.key, required this.course});
  final CourseDetails course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = AppLocalizations.of(context)!;
    final color = ref.watch(primaryColorProvider);

    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.5,
              child: CourseDetailsWidget(course: course),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.5,
              child: RegisterWidget(course: course,isMobile: false,),
            ),
          ],
        ),
      ),
    );
  }
}
