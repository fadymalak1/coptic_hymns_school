import 'dart:developer';

import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/providers/local_provider.dart';
import 'package:coptic_hymns_school/shared/screens/error_screen.dart';
import 'package:coptic_hymns_school/shared/utils/animations.dart';
import 'package:coptic_hymns_school/shared/utils/go_router.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'views/home/layout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
void main() {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}
final GlobalKey sectionKey = GlobalKey(); // key for the target widget

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final layoutDataAsync = ref.watch(layoutDataProvider); // ✅ watch instead of read

    return layoutDataAsync.when(
      data: (layoutData) {
        final color = hexToColor(layoutData.appSettings.color);

        return MaterialApp.router(
          title: locale.languageCode == 'ar'
              ? 'مدرسة الألحان القبطية'
              : 'Coptic Hymns School',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: color),
            useMaterial3: true,
            fontFamily: 'Cairo',
          ),
          locale: locale,
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          routerConfig: router,
        );
      },
      loading: () => Center(
        child: Lottie.asset(
          Animations.loadingAnimation,
          repeat: true,
          width: 200,
          height: 200,
        ),
      ),
      error: (Object error, StackTrace stackTrace) {
        log("error $error");
        return const ErrorScreen();
      },
    );
  }
}
