import 'dart:async';
import 'dart:developer';
import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/information.dart';
import 'package:coptic_hymns_school/shared/widgets/call_to_action/call_to_action.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:coptic_hymns_school/views/home/widgets/hero_section/fede_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeroSectionMobile extends ConsumerWidget {
  final Information information;
  const HeroSectionMobile({super.key, required this.information});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = AppLocalizations.of(context)!;
    final color = ref.watch(primaryColorProvider);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CenteredView(
        horizontalPadding: 30,
        child: Column(
          children: [
            FadeCarousel(images: information.images,height: MediaQuery.of(context).size.height/2,),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(child: Text("${information.title}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: color,),)),
                SizedBox(height: 10,),
                Text("${information.subTitle}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey,),textAlign: TextAlign.center,maxLines: 4,overflow: TextOverflow.ellipsis,),
                SizedBox(height: 20,),
                Center(child: CallToAction(translate.explore_courses)),
                SizedBox(height: 20,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}