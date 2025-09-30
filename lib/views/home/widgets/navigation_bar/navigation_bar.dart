import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'language_dropdown_widget.dart';
import 'navigation_bar_desktop.dart';
import 'navigation_bar_mobile.dart';

class NavigationBarWidget extends ConsumerWidget {
  const NavigationBarWidget({super.key}) ;

  @override

  Widget build(BuildContext context, WidgetRef ref) {
    final information = ref.read(layoutDataProvider).value!.information;

    return ScreenTypeLayout(
      mobile: NavigationBarMobile(title: information.logo,),
      desktop: NavigationBarDesktop(title: information.logo,),
    );
  }
}
