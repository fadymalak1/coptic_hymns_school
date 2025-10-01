import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/course_details.dart';
import 'package:coptic_hymns_school/shared/utils/images.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseDetailsWidget extends ConsumerWidget {
  const CourseDetailsWidget({super.key,required this.course});
  final CourseDetails course;

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
              child: course.image!=null ? Image.network(
                course.image??"",
                fit: BoxFit.cover,
                height: 300,
                width: MediaQuery.of(context).size.width,
              ):Image.asset(AppImages.placeHolder, fit: BoxFit.cover,height: 300,
              width: MediaQuery.of(context).size.width,),
            ),

            const SizedBox(height: 16),

            // Course Name
             Text(
              course.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),

            const SizedBox(height: 8),

            // Description
             Text(
              course.description,
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),

            const SizedBox(height: 16),

            // Duration
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(translate.duration),
                Text(
                  "${course.durationByWeek} ${translate.weeks}",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Students
            if(int.parse(course.enrollmentsCount)>0)...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(translate.students_count),
                  Text(
                    course.enrollmentsCount.toString(),
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
                  course.instructor,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Rating
            if(course.rate!="0.00")
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(translate.rating),
                Text(
                  course.rate.toString(),
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const Divider(height: 32,thickness: 1,color: Colors.grey,),

            // Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  translate.totalPrice,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  course.price,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
