import 'dart:io';

import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/enrollment_response.dart';
import 'package:coptic_hymns_school/shared/widgets/custom_snack_bar.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:coptic_hymns_school/views/payment/providers/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';

class UploadPayment extends ConsumerStatefulWidget {
  final EnrolmentResponse enrolment;
  final bool isMobile;

  const UploadPayment({Key? key, required this.enrolment,required this.isMobile}) : super(key: key);

  @override
  ConsumerState<UploadPayment> createState() => _UploadPaymentState();
}

class _UploadPaymentState extends ConsumerState<UploadPayment> {
  Uint8List? fileBytes;
  String? fileName;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        fileBytes = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    }
  }

  void removeFile() {
    setState(() {
      fileBytes = null;
      fileName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = ref.watch(primaryColorProvider);
    final translate = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate.uploadPaymentReceipt,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: pickFile,
          child: Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              border: Border.all(
                color: color.withOpacity(0.1),
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(8),
              color: fileBytes == null
                  ? color.withOpacity(0.05)
                  : Colors.green.withOpacity(0.1),
            ),
            child: fileBytes == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload,
                        size: 40,
                        color: color.withOpacity(0.5),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        translate.clickToUploadReceipt,
                        style: TextStyle(color: color.withOpacity(0.5)),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        translate.allowedFormats,
                        style: TextStyle(
                          color: color.withOpacity(0.5),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                : Stack(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.check_circle_outline,
                              size: 40,
                              color: Colors.green,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              fileName!,
                              style: const TextStyle(color: Colors.black),
                            ),
                            const SizedBox(height: 4),
                            TextButton(
                              onPressed: removeFile,
                              child: Text(
                                translate.remove,
                                style: const TextStyle(
                                  color: Colors.green,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: fileBytes == null
                ? null
                : () async {

                    await ref.read(paymentUploadProvider.notifier).uploadPayment(
                      fileBytes!,
                      fileName!,
                      widget.enrolment.enrollmentId.toString(),
                    );
                    // متابعة الحالة
                    final state = ref.read(paymentUploadProvider);

                    state.when(
                      data: (_) {
                        if (context.mounted) {
                          CustomSnackBar.show(
                            context: context,
                            message: translate.paymentSubmitted,
                            icon: Icons.check_circle,
                            color: Colors.green,
                            isMobile: widget.isMobile,
                          );
                          context.go("/"); // رجوع للـ Layout
                        }
                      },
                      loading: () {
                        CustomSnackBar.show(
                          context: context,
                          message: translate.loading,
                          icon: Icons.hourglass_bottom,
                          color: Colors.orange,
                          isMobile: widget.isMobile,
                        );
                      },
                      error: (err, _) {
                        if (context.mounted) {
                          CustomSnackBar.show(
                            context: context,
                            message: translate.failedToSubmit,
                            icon: Icons.error,
                            color: Colors.red,
                            isMobile: widget.isMobile,
                          );
                        }
                      },
                    );
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              translate.submitPayment,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
