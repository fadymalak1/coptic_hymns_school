import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/enrollment_response.dart';
import 'package:coptic_hymns_school/shared/utils/helper.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:coptic_hymns_school/views/payment/providers/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class PaymentInfoEgypt extends ConsumerWidget {
  const PaymentInfoEgypt({super.key, required this.enrolment,required this.isMobile});
  final EnrolmentResponse enrolment;
  final bool isMobile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(primaryColorProvider);
    final translate = AppLocalizations.of(context)!;
    final paymentMethod = ref.watch(selectedPaymentMethodProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate.paymentMethod,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  ref.read(selectedPaymentMethodProvider.notifier).state =
                  "instapay";
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: paymentMethod == "instapay"
                        ? color.withOpacity(0.1)
                        : Colors.transparent,
                    border: paymentMethod == "instapay"
                        ? Border.all(color: color.withOpacity(0.4))
                        : Border.all(color: color.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    translate.instapay,
                    style: TextStyle(
                      fontSize: 16,
                      color: color,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: InkWell(
                onTap: () {
                  ref.read(selectedPaymentMethodProvider.notifier).state =
                  "wallet";
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: paymentMethod == "wallet"
                        ? color.withOpacity(0.1)
                        : Colors.transparent,
                    border: paymentMethod == "wallet"
                        ? Border.all(color: color.withOpacity(0.4))
                        : Border.all(color: color.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    translate.mobileWallet,
                    style: TextStyle(
                      fontSize: 16,
                      color: color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        _PaymentInfoEgyptWidget(
          paymentMethod: paymentMethod,
          enrolment: enrolment,
          isMobile: isMobile,
        ),
      ],
    );
  }
}

class _PaymentInfoEgyptWidget extends ConsumerWidget {
  const _PaymentInfoEgyptWidget({
    super.key,
    required this.paymentMethod,
    required this.enrolment,
    required this.isMobile,
  });

  final String paymentMethod;
  final EnrolmentResponse enrolment;
  final bool isMobile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(primaryColorProvider);
    final translate = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            paymentMethod == "instapay"
                ? Text(
              translate.instapayUsername,
              style: TextStyle(color: color.withOpacity(0.8), fontSize: 14),
            )
                : Text(
              translate.mobileNumber,
              style: TextStyle(color: color.withOpacity(0.6), fontSize: 14),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                copyToClipboard(context, paymentMethod=="instapay"?"${enrolment.accountName}":enrolment.accountNumber,isMobile);
              },
              icon: const Icon(Icons.copy_outlined),
              color: color,
              iconSize: 20,
            )
          ]),
          paymentMethod == "instapay"
              ? Text(
            "@${enrolment.accountName}",
            style: TextStyle(color: color, fontSize: 20),
          )
              : Text(
            enrolment.accountNumber ?? "",
            style: TextStyle(
              color: color,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            translate.sendAmount(
              enrolment.price ?? "0",
              paymentMethod == "instapay"
                  ? translate.username
                  : translate.number,
            ),
          ),
        ],
      ),
    );
  }
}
