import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/course.dart';
import 'package:coptic_hymns_school/shared/models/enrolled_courses.dart';
import 'package:coptic_hymns_school/shared/utils/images.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyCourseCard extends ConsumerWidget {
  const MyCourseCard({super.key, required this.course});
  final Enrollment course;

  @override
  Widget build(BuildContext context,WidgetRef red) {
    final color = red.watch(primaryColorProvider);
    final translate = AppLocalizations.of(context)!;
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 180,
                child: course.course.imageUrl==null?Image.asset(AppImages.placeHolder,fit: BoxFit.cover,):Image.network(
                  course.course.imageUrl??"", // ensure your Course model has this field
                  fit: BoxFit.cover,
                ),
              ),

            ],
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  course.course.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color:color,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  course.course.description,
                  style: const TextStyle(color: Colors.black87),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),

                // Students + Duration
                Row(
                  children: [
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                           Icon(Icons.people_alt_outlined, size: 16, color: color),
                          const SizedBox(width: 6),
                          Text(
                            "${course.course.enrollmentsCount} ${translate.students}",
                            style: const TextStyle(fontSize: 12, color: Colors.black87,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.access_time, size: 16, color: color),
                          const SizedBox(width: 6),
                          Text(
                            "${course.course.durationByWeek} ${translate.weeks}",
                            style: const TextStyle(fontSize: 12, color: Colors.black87,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
               SizedBox(height: 16,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      context.go('/my-course-details',extra: course);
                    },
                    child: Text(
                      translate.viewCourse,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
