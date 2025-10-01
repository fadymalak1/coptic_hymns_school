import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/enrollment_response.dart';
import 'package:coptic_hymns_school/shared/utils/helper.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';


class PaymentInfoOther extends ConsumerWidget {
  const PaymentInfoOther({super.key, required this.enrolment,required this.isMobile});
  final EnrolmentResponse enrolment;
  final bool isMobile;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(primaryColorProvider);
    final translate = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate.paymentMethod,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.1)),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translate.usBankTransfer,
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),

              /// Render rows only if value != null && not empty
              ..._buildInfoRows(context, color, translate,isMobile),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildInfoRows(
      BuildContext context, Color color, AppLocalizations translate, bool isMobile) {
    final rows = <Widget>[];

    void addRow(String label, String? value) {
      if (value != null && value.trim().isNotEmpty) {
        if (rows.isNotEmpty) {
          rows.add(_divider(color));
        }
        rows.add(_buildRow(context, label: label, value: value, color: color,isMobile: isMobile));
      }
    }

    addRow(translate.accountHolder, enrolment.accountName);
    addRow(translate.accountNumber, enrolment.accountNumber);
    addRow(translate.swiftCode, enrolment.swift);
    addRow(translate.iban, enrolment.iban);
    addRow(translate.bankName, enrolment.bankName);
    addRow(translate.bankAddress, enrolment.bankAddress);

    return rows;
  }

  Widget _buildRow(BuildContext context,
      {required String label, required String? value, required Color color,required bool isMobile}) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(color: color.withOpacity(0.7), fontSize: 14),
        ),
        const Spacer(),
        Expanded(
          child: Text(
            value ?? "",
            textAlign: TextAlign.end,
            style: TextStyle(color: color, fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          onPressed: () => copyToClipboard(context, value,isMobile),
          icon: Icon(Icons.copy, color: color.withOpacity(0.7)),
          iconSize: 16,
        ),
      ],
    );
  }

  Widget _divider(Color color) {
    return Divider(
      height: 20,
      thickness: 1,
      color: color.withOpacity(0.05),
    );
  }
}
