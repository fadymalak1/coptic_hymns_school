import 'dart:developer';

import 'package:coptic_hymns_school/shared/providers/local_provider.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class LanguageDropdown extends ConsumerWidget {
  const LanguageDropdown({super.key, required this.inDrawer});
  final bool inDrawer;

  final Map<String, String> languages = const {
    "English": "en",
    "العربية": "ar",
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final color = ref.watch(primaryColorProvider);
    return Container(
      width: inDrawer? double.infinity:null,
      decoration:null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            padding: const EdgeInsets.all(0),
            value: languages.entries
                .firstWhere((e) => e.value == locale.languageCode)
                .key,
            style: const TextStyle(color: Colors.black, fontSize: 14),
            icon: inDrawer?null:const Icon(Icons.keyboard_arrow_down),
            items: languages.keys.map((lang) {
              return DropdownMenuItem(
                value: lang,
                child: Text(lang),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                final code = languages[value]!;
                ref.read(localeProvider.notifier).toggleLocale();
              }
            },
          ),
        ),
      ),
    );
  }
}
