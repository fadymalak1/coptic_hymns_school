
import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationBarMobile extends ConsumerWidget {
  final String title;
  const NavigationBarMobile({super.key , required this.title}) ;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedTabProvider);
    final translate = AppLocalizations.of(context)!;
    final color = ref.watch(primaryColorProvider);
    return Container(
      height: 80,
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

          children: <Widget>[
            FittedBox(fit: BoxFit.scaleDown,child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: color,),)),
            IconButton(onPressed: (){
              Scaffold.of(context).openDrawer();
            }, icon: Icon(Icons.menu, color: color,))
          ],
        ),
      ),
    );
  }
}
