import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:coptic_hymns_school/views/home/widgets/navigation_bar/language_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'drawer_item.dart';
import 'navigation_drawer_header.dart';

class NavigationDrawerWidget extends ConsumerWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = AppLocalizations.of(context)!;
    final selectedTab = ref.watch(selectedTabProvider);
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        children: [
          NavigationDrawerHeader(),
          SizedBox(height: 25,),
          DrawerItem( title: translate.home, onTap: (){ ref.read(selectedTabProvider.notifier).state = 0; }, isSelected: selectedTab == 0),
          SizedBox(height: 10,),
          DrawerItem( title:translate.my_courses, onTap: (){ ref.read(selectedTabProvider.notifier).state = 1; },isSelected:selectedTab == 1,),
          SizedBox(height: 10,),
          SizedBox(
            width: double.infinity,
            child: Divider(
              color: Colors.grey.shade400,
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: LanguageDropdown(inDrawer: true,),
          ),
        ],
      ),
    );
  }
}
