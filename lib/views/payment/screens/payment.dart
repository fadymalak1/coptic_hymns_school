import 'package:coptic_hymns_school/shared/models/enrollment_response.dart';
import 'package:coptic_hymns_school/views/payment/screens/payment_desktop.dart';
import 'package:coptic_hymns_school/views/payment/screens/payment_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Payment extends ConsumerWidget {
  const Payment({super.key, required this.enrolment});
  final EnrolmentResponse enrolment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenTypeLayout(
      mobile: const PaymentMobile(),
      desktop: const PaymentDesktop(),
    );
  }
}
