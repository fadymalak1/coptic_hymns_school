import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckAccess extends ConsumerWidget {
  const CheckAccess({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final color = ref.watch(primaryColorProvider);
    final translate = AppLocalizations.of(context)!;
    return Container(
      child: CenteredView(
        child: Column(
          children: [
            Text("Check Access", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: color,),),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
