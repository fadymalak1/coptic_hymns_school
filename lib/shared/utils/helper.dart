import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyToClipboard(BuildContext context, String? value,bool isMobile) {
  if (value == null || value.trim().isEmpty) return;
  Clipboard.setData(ClipboardData(text: value));

  final color = Theme.of(context).colorScheme.primary;
  final translate = AppLocalizations.of(context)!;

  CustomSnackBar.show(context: context, message: translate.copied,color:color);
}
