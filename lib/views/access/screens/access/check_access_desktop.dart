import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/widgets/centered_view/centered_view.dart';
import 'package:coptic_hymns_school/shared/widgets/custom_snack_bar.dart';
import 'package:coptic_hymns_school/views/access/providers/access_provider.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CheckAccessDesktop extends ConsumerWidget {
  const CheckAccessDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(primaryColorProvider);
    final translate = AppLocalizations.of(context)!;
    final isLoading = ref.watch(accessLoadingProvider);
    final email = ref.watch(emailProvider);
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text(
                    translate.access_title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: color,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    translate.access_description,
                    style: TextStyle(
                      fontSize: 16,
                      color: color.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translate.emailAddress,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        validator: (v) {
                          if (v == null || v.isEmpty)
                            return translate.fieldRequired;
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!emailRegex.hasMatch(v))
                            return translate.invalidEmail;
                          return null;
                        },
                        onChanged: (v) {
                          ref.read(emailProvider.notifier).state = v;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: translate.enterEmailAddress,
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: isLoading
                            ? null
                            : () async {
                          final email = ref.read(emailProvider);
                          if (email!.isEmpty) return;

                          ref.read(accessLoadingProvider.notifier).state = true;
                          try {
                            final courses = await ref.read(coursesProvider(email).future);

                            if (courses.isEmpty) {
                              CustomSnackBar.show(
                                context: context,
                                message: translate.noCoursesFound,
                                icon: Icons.error,
                                color: Colors.red,
                              );
                            } else {
                              // ✅ save email in provider
                              ref.read(emailProvider.notifier).state = email;
                              ref.read(myCoursesProvider.notifier).state = courses;
                              context.go('/my-courses');
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Error: $e")),
                            );
                          } finally {
                            ref.read(accessLoadingProvider.notifier).state = false;
                          }
                        },

                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                ),
                              )
                            : Text(
                                translate.checkAccess,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
