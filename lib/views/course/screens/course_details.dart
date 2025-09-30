import 'package:coptic_hymns_school/l10n/app_localizations.dart';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseDetails extends ConsumerWidget {
  final int courseId;
  const CourseDetails({super.key, required this.courseId});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final translate = AppLocalizations.of(context)!;
    final color = ref.watch(primaryColorProvider);
    return Scaffold(
      body: const Center(
        child: Text('Course Details'),
      ),
    );
  }
}
