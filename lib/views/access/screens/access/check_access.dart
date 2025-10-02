import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'check_access_desktop.dart';
import 'check_access_mobile.dart';


class CheckAccess extends ConsumerWidget {
  const CheckAccess({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Center(
      child: ScreenTypeLayout(
        mobile: CheckAccessMobile(),
        desktop: CheckAccessDesktop(),
      ),
    );
  }
}
