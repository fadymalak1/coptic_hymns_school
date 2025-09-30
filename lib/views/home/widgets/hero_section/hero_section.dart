import 'dart:async';
import 'dart:developer';
import 'package:coptic_hymns_school/shared/models/information.dart';
import 'package:coptic_hymns_school/shared/widgets/call_to_action/call_to_action.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:coptic_hymns_school/views/home/widgets/hero_section/fede_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'hero_section_desktop.dart';
import 'hero_section_mobile.dart';

class HeroSectionWidget extends ConsumerWidget {
  final Information information;
  const HeroSectionWidget({super.key, required this.information});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(primaryColorProvider);
    return Container(

      color: color.withOpacity(0.1),
      child: Column(
        children: [
          SizedBox(height: 20,),
          ScreenTypeLayout(
            mobile: HeroSectionMobile(information: information,),
            desktop: HeroSectionDesktop(information: information,),
          ),
        ],
      ),
    );
  }
}