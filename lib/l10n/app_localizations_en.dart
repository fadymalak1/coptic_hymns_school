// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get my_courses => 'My Courses';

  @override
  String get explore_courses => 'Explore Courses';

  @override
  String get skill_up_now => 'Skill up now';

  @override
  String get students_count => 'Students Count';

  @override
  String get experience => 'Experience';

  @override
  String get years => 'Years';

  @override
  String get courses => 'Courses';

  @override
  String get coptic_hymns_courses => 'Coptic Hymns Courses';

  @override
  String get students => 'Students';

  @override
  String get register_now => 'Register Now';

  @override
  String get courseDetails => 'Course Details';

  @override
  String get duration => 'Duration:';

  @override
  String get weeks => 'Weeks';

  @override
  String get instructor => 'Instructor:';

  @override
  String get rating => 'Rating:';

  @override
  String get totalPrice => 'Total Price:';

  @override
  String get studentCount => 'Student Count:';

  @override
  String get registerForCourse => 'Register for Course';

  @override
  String get fullName => 'Full Name';

  @override
  String get enterFullName => 'Enter Full Name';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get enterEmailAddress => 'Enter Email Address';

  @override
  String get phoneNumberWhatsApp => 'Phone Number (WhatsApp)';

  @override
  String get enterPhoneNumberWhatsApp => 'Enter Phone Number (WhatsApp)';

  @override
  String get registrationSummary => 'Registration Summary:';

  @override
  String get course => 'Course:';

  @override
  String get completeRegistration => 'Complete Registration';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get invalidEmail => 'Please enter a valid email address';

  @override
  String get invalidPhone => 'Please enter a valid phone number';

  @override
  String minLength(Object min) {
    return 'This field must be at least $min characters';
  }

  @override
  String maxLength(Object max) {
    return 'This field must be less than $max characters';
  }

  @override
  String get passwordMismatch => 'Passwords do not match';

  @override
  String get invalidNumber => 'Please enter a valid number';

  @override
  String minValue(Object min) {
    return 'Value must be greater than or equal to $min';
  }

  @override
  String maxValue(Object max) {
    return 'Value must be less than or equal to $max';
  }
}
