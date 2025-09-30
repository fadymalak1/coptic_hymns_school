
import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'language_dropdown_widget.dart';
import 'navigation_item.dart';

class NavigationBarDesktop extends ConsumerWidget {
  final String title;
  const NavigationBarDesktop({super.key , required this.title}) ;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = AppLocalizations.of(context)!;
    final selectedTab = ref.watch(selectedTabProvider);
    final color = ref.watch(primaryColorProvider);
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: CenteredView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color:color,),),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                NavBarItem(onTap: () {
                  ref.read(selectedTabProvider.notifier).state = 0;
                }, isSelected: selectedTab == 0, label: translate.home),
                SizedBox(
                  width: 30,
                ),
                NavBarItem(onTap: () {
                  ref.read(selectedTabProvider.notifier).state = 1;
                }, isSelected: selectedTab == 1, label: translate.my_courses),
                SizedBox(
                  width: 30,
                ),

                VerticalDivider( color: Colors.grey.shade400, thickness: 1,indent: 30, endIndent: 30, ),
                SizedBox(
                  width: 30,
                ),
                LanguageDropdown(inDrawer: false,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
