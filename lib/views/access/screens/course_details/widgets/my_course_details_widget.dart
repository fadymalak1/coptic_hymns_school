import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/course_details.dart';
import 'package:coptic_hymns_school/shared/models/enrolled_courses.dart';
import 'package:coptic_hymns_school/shared/utils/images.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCourseDetailsWidget extends ConsumerWidget {
  const MyCourseDetailsWidget({super.key,required this.courseDetails});
  final Enrollment courseDetails;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final translate = AppLocalizations.of(context)!;
    final color = ref.watch(primaryColorProvider);
    return Card(
      elevation: 4,
      color: Colors.white,
      margin: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              translate.courseDetails,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: courseDetails.course.imageUrl!=null ? Image.network(
                courseDetails.course.imageUrl??"",
                fit: BoxFit.cover,
                height: 300,
                width: MediaQuery.of(context).size.width,
              ):Image.asset(AppImages.placeHolder, fit: BoxFit.cover,height: 300,
              width: MediaQuery.of(context).size.width,),
            ),

            const SizedBox(height: 16),

            // Course Name
             Text(
               courseDetails.course.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),

            const SizedBox(height: 8),

            // Description
             Text(
               courseDetails.course.description,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),

            const SizedBox(height: 16),

            // Duration
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(translate.duration),
                Text(
                  "${courseDetails.course.durationByWeek} ${translate.weeks}",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Students
            if(int.parse(courseDetails.course.enrollmentsCount)>0)...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(translate.studentCount),
                  Text(
                    courseDetails.course.enrollmentsCount.toString(),
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 6),
            ],


            // Instructor
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(translate.instructor),
                Text(
                  courseDetails.course.instructor,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(translate.registrationDate),
                Text(
                  courseDetails.enrolledAt.toString(),
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            )



          ],
        ),
      ),
    );
  }
}
