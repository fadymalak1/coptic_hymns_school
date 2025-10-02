import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/enrolled_courses.dart';
import 'package:coptic_hymns_school/shared/utils/images.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoWidget extends ConsumerWidget {
  const VideoWidget({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final translate = AppLocalizations.of(context)!;
    final color = ref.watch(primaryColorProvider);
    return GestureDetector(
      onTap: ()async{
        await launchUrl(Uri.parse(video.url));
      },
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              ClipRRect(
                child: Image.asset(AppImages.videoIcon,
                height: 35,
                color: color,
                width: 35,),
                borderRadius: BorderRadius.circular(12),
              ),
              const SizedBox(width: 12),
              Text(video.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const Spacer(),
              Icon(Icons.arrow_forward_ios,color:color,),
            ],
          ),
        ),
      ),
    );
  }
}
