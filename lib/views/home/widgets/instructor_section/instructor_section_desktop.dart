import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/instructor.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:coptic_hymns_school/views/home/widgets/hero_section/fede_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'instructor_feature.dart';

class InstructorSectionDesktop extends ConsumerWidget {
  const InstructorSectionDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(primaryColorProvider);
    final translate = AppLocalizations.of(context)!;
    final instructor = ref.read(layoutDataProvider).value!.instructor;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color.withOpacity(0.1),
              ),
              padding: const EdgeInsets.all(12),
              child: FadeCarousel(
                images: instructor.images,
                height: MediaQuery.of(context).size.height / 1.3,
                showIndicators: true,
              ),
            ),
          ),
          SizedBox(width: 40),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${instructor.fullName}",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 5,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "${instructor.specialty}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: color.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "${instructor.description}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: InstructorFeature(
                          color: color,
                          label: translate.students_count,
                          value: "${instructor.studentsCount}",
                          icon: Icons.people,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: InstructorFeature(
                          color: color,
                          label: translate.experience,
                          value: "${instructor.experience} ${translate.years}",
                          icon: Icons.access_time_filled,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  if(instructor.contacts.facebook.isNotEmpty)
                  Row(
                    children: [
                      FloatingActionButton(elevation:2,onPressed: ()async{
                        await launchUrl(Uri.parse(instructor.contacts.facebook));
                      },child: Icon(Icons.facebook,color: color,),shape: const CircleBorder(),backgroundColor: Colors.white,),
                      SizedBox(width: 12,),
                      if(instructor.contacts.whatsapp.isNotEmpty)
                        FloatingActionButton(elevation:2,onPressed: ()async{
                          if (await canLaunchUrl(Uri.parse(instructor.contacts.whatsapp))) {
                            await launchUrl(
                              Uri.parse(instructor.contacts.whatsapp),
                              mode: LaunchMode.externalApplication, // ensures it opens in new tab/app
                            );
                          } else {
                            throw "Could not launch ${instructor.contacts.whatsapp}";
                          }
                        },child: Icon(Icons.call,color: color,),shape: const CircleBorder(),backgroundColor: Colors.white,),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
