import 'package:coptic_hymns_school/main.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CallToActionMobile extends ConsumerWidget {
  final String title;
  CallToActionMobile(this.title);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(primaryColorProvider);
    void scrollToSection() {
      final context = sectionKey.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
    return GestureDetector(
      onTap: (){
        scrollToSection();
      },
      child: Container(
        height: 50,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),

        ),
      ),
    );
  }
}
