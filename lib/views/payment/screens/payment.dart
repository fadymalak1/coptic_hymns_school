import 'package:coptic_hymns_school/shared/models/enrollment_response.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:coptic_hymns_school/views/payment/screens/payment_desktop.dart';
import 'package:coptic_hymns_school/views/payment/screens/payment_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Payment extends ConsumerWidget {
  const Payment({super.key, required this.enrolment, required});
  final EnrolmentResponse enrolment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color=ref.watch(primaryColorProvider);
    return Container(
      color: Colors.white,
      child: ScreenTypeLayout(
        mobile: PaymentMobile(enrolment: enrolment,),
        desktop: PaymentDesktop(enrolment: enrolment,),
      ),
    );
  }
}
