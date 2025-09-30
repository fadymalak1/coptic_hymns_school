import 'dart:developer';

import 'package:coptic_hymns_school/shared/providers/local_provider.dart';
import 'package:coptic_hymns_school/shared/screens/error_screen.dart';
import 'package:coptic_hymns_school/shared/utils/animations.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/shared/widgets/drawer/navigation_drawer.dart';
import 'package:coptic_hymns_school/views/home/home.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:coptic_hymns_school/views/home/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';


class LayoutView extends ConsumerStatefulWidget {
  const LayoutView({super.key});

  @override
  ConsumerState<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends ConsumerState<LayoutView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final selectedTab = ref.watch(selectedTabProvider);
    final locale = ref.watch(localeProvider);
    final isArabic = locale.languageCode == 'ar';
    final ScrollController _scrollController = ScrollController();



    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            return Scaffold(
              drawer: sizingInformation.deviceScreenType==DeviceScreenType.mobile ? NavigationDrawerWidget() : null,
              body: Column(
                children: [
                  NavigationBarWidget(),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,

                      child: selectedTab == 0
                          ? HomeView()
                          : const Center(child: Text("My Courses")),
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
