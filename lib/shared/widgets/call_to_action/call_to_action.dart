import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'call_to_action_desktop.dart';
import 'call_to_action_mobile.dart';

class CallToAction extends StatelessWidget {
  final String title;
  CallToAction(this.title);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(mobile: CallToActionMobile(title), desktop: CallToActionDesktop(title),);
  }
}
