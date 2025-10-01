import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/shared/models/course_details.dart';
import 'package:coptic_hymns_school/views/course/providers/course_details_provider.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class RegisterWidget extends ConsumerStatefulWidget {
  const RegisterWidget({super.key, required this.course, required this.isMobile});
  final CourseDetails course;
  final bool isMobile;

  @override
  ConsumerState<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends ConsumerState<RegisterWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context)!;
    final color = ref.watch(primaryColorProvider);

    return Card(
      elevation: 4,
      color: Colors.white,
      margin: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              translate.registerForCourse,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Full Name
            Text(translate.fullName, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextFormField(
              controller: _nameCtrl,
              keyboardType: TextInputType.name,
              validator: (v) => v == null || v.isEmpty ? translate.fieldRequired : null,
              decoration: InputDecoration(
                hintText: translate.enterFullName,
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide.none),
              ),
            ),
            widget.isMobile ? const SizedBox(height: 16) : const SizedBox(height: 22),

            // Email
            Text(translate.emailAddress, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextFormField(
              controller: _emailCtrl,
              validator: (v) {
                if (v == null || v.isEmpty) return translate.fieldRequired;
                final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                if (!emailRegex.hasMatch(v)) return translate.invalidEmail;
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: translate.enterEmailAddress,
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide.none),
              ),
            ),
            widget.isMobile ? const SizedBox(height: 16) : const SizedBox(height: 22),

            // Phone
            Text(translate.phoneNumberWhatsApp, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextFormField(
              controller: _phoneCtrl,
              keyboardType: TextInputType.phone,
              validator: (v) => v == null || v.isEmpty ? translate.fieldRequired : null,
              decoration: InputDecoration(
                hintText: translate.enterPhoneNumberWhatsApp,
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),borderSide: BorderSide.none),
              ),
            ),
            widget.isMobile ? const SizedBox(height: 16) : const Spacer(),

            // Summary
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(translate.registrationSummary, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("${translate.course} ${widget.course.title}"),
                Text("${translate.totalPrice} ${widget.course.price}"),
                Text("${translate.duration} ${widget.course.durationByWeek} ${translate.weeks}"),
              ]),
            ),
            const SizedBox(height: 15),

            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed:  _isLoading
                    ? null
                    : () async {
                  final repo = ref.read(courseDetailsRepositoryProvider);
                  if (_formKey.currentState!.validate()) {
                    try {
                    setState(() => _isLoading = true);

                    final response= await repo.enrollCourse(
                       widget.course.id,
                      _nameCtrl.text,
                       _emailCtrl.text,
                      _phoneCtrl.text,
                    );
                    if (!mounted) return;

                    // Navigate with GoRouter
                    context.go(
                      "/payment",
                      extra: response

                    );
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error: $e")),
                        );
                      }
                    } finally {
                      if (mounted) setState(() => _isLoading = false);
                    }
                  }
                },
                child: _isLoading
                    ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                )
                    : Text(
                  translate.completeRegistration,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),

          ]),
        ),
      ),
    );
  }
}
