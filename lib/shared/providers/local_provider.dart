import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'dart:html' as html; // for web storage

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(_getSavedLocale());

  // Load saved locale from localStorage
  static Locale _getSavedLocale() {
    final savedLang = html.window.localStorage['languageCode'];
    if (savedLang != null && savedLang.isNotEmpty) {
      return Locale(savedLang);
    }
    return const Locale('en'); // default
  }

  void toggleLocale() {
    if (state.languageCode == 'en') {
      setLocale(const Locale('ar'));
    } else {
      setLocale(const Locale('en'));
    }
  }

  void setLocale(Locale locale) {
    state = locale;
    // Save to localStorage
    html.window.localStorage['languageCode'] = locale.languageCode;
  }
}

final localeProvider =
StateNotifierProvider<LocaleNotifier, Locale>((ref) => LocaleNotifier());
