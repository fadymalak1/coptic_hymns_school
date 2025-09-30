import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:coptic_hymns_school/views/home/widgets/navigation_bar/navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerItem extends ConsumerWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;


  const DrawerItem({super.key, required this.title, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(width: double.infinity,child: NavBarItem(onTap:onTap, isSelected:isSelected, label: title )),
    );
  }
}
