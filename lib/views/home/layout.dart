import 'dart:developer';

import 'package:coptic_hymns_school/shared/providers/local_provider.dart';
import 'package:coptic_hymns_school/shared/screens/error_screen.dart';
import 'package:coptic_hymns_school/shared/utils/animations.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/shared/widgets/drawer/navigation_drawer.dart';
import 'package:coptic_hymns_school/views/access/screens/access/check_access.dart';
import 'package:coptic_hymns_school/views/home/home.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:coptic_hymns_school/views/home/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutView extends ConsumerWidget {
  final Widget child;
  final String location; // 👈 added
  const LayoutView({super.key, required this.child, required this.location});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final isArabic = locale.languageCode == 'ar';

    // detect tabs by path
    final isTabPage = location == '/' || location == '/check-access';

    int tabIndex = 0;
    if (location == '/') {
      tabIndex = 0;
    } else if (location == '/check-access') {
      tabIndex = 1;
    }

    // 👇 حل المشكلة: حدّث الـ provider بعد الـ build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(selectedTabProvider.notifier).state = tabIndex;
    });

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          return Scaffold(
            drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? const NavigationDrawerWidget()
                : null,
            body: Column(
              children: [
                const NavigationBarWidget(),
                Expanded(
                  child: isTabPage
                      ? IndexedStack(
                    index: tabIndex,
                    children: const [
                      HomeView(),
                      CheckAccess(),
                    ],
                  )
                      : child,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
