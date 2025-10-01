import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/enrollment_response.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:coptic_hymns_school/views/payment/widgets/payment_info_egypt.dart';
import 'package:coptic_hymns_school/views/payment/widgets/payment_info_other.dart';
import 'package:coptic_hymns_school/views/payment/widgets/upload_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMobile extends ConsumerWidget {
  const PaymentMobile({super.key,required this.enrolment});
  final EnrolmentResponse enrolment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translate = AppLocalizations.of(context)!;
    final color=ref.watch(primaryColorProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(translate.completePayment,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("${translate.course} ${enrolment.courseName}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                  Row(
                      children: [
                        Text("${translate.totalPrice}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                        Spacer(),
                        Text("${enrolment.price}${enrolment.paymentMethod=="insta-wallet"?" EGP":"USD"}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800,color: color),),
                      ]
                  ),
                  Divider(height: 40,thickness: 1,color: color.withOpacity(0.2)),
                  enrolment.paymentMethod=="insta-wallet"?PaymentInfoEgypt(enrolment: enrolment,isMobile: true,):PaymentInfoOther(enrolment: enrolment,isMobile: true,),
                  SizedBox(height: 30,),
                  UploadPayment(enrolment: enrolment,isMobile: true,),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
