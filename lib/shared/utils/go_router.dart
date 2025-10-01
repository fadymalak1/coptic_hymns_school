import 'package:coptic_hymns_school/shared/models/enrollment_response.dart';
import 'package:coptic_hymns_school/views/access/screens/check_access.dart';
import 'package:coptic_hymns_school/views/course/screens/course_details.dart';
import 'package:coptic_hymns_school/views/home/home.dart';
import 'package:coptic_hymns_school/views/home/layout.dart';
import 'package:coptic_hymns_school/views/payment/screens/payment.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return LayoutView(
          child: child,
          location: state.fullPath ?? '/', // 👈 pass the current route
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: '/check-access',
          builder: (context, state) => const CheckAccess(),
        ),
        GoRoute(
          path: '/course/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return CourseDetails(courseId: int.parse(id));
          },
        ),
        GoRoute(
          path: '/payment',
          builder: (context, state) {
            final enrolment = state.extra as EnrolmentResponse;
            return Payment(enrolment: enrolment);
          },
        ),
      ],
    ),
  ],
);
