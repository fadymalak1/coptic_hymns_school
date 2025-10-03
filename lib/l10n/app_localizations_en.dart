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

  @override
  String get completePayment => 'Complete Payment';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get instapay => 'InstaPay';

  @override
  String get mobileWallet => 'Mobile Wallet';

  @override
  String get instapayUsername => 'InstaPay Username';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String sendAmount(Object amount, Object type) {
    return 'Send $amount EGP to this $type and upload the receipt below';
  }

  @override
  String get username => 'username';

  @override
  String get number => 'number';

  @override
  String get usBankTransfer => 'US Bank Transfer';

  @override
  String get accountHolder => 'Account Holder';

  @override
  String get accountNumber => 'Account Number';

  @override
  String get swiftCode => 'SWIFT Code';

  @override
  String get iban => 'IBAN';

  @override
  String get bankName => 'Bank Name';

  @override
  String get bankAddress => 'Bank Address';

  @override
  String get copied => 'Copied to clipboard!';

  @override
  String get uploadPaymentReceipt => 'Upload Payment Receipt';

  @override
  String get clickToUploadReceipt => 'Click to upload receipt';

  @override
  String get allowedFormats => 'JPG, PNG, or JPEG';

  @override
  String get remove => 'Remove';

  @override
  String get submitPayment => 'Submit Payment';

  @override
  String get paymentSubmitted => 'Payment Submitted ✅';

  @override
  String get failedToSubmit => 'Failed to submit payment';

  @override
  String get loading => 'Loading...';

  @override
  String get access_title => 'Access Your Courses';

  @override
  String get access_description =>
      'Enter your registered email address to access your enrolled courses.';

  @override
  String get checkAccess => 'Check Access';

  @override
  String get viewCourse => 'View Course';

  @override
  String get noCoursesFound => 'No courses found for this email';

  @override
  String get my_learning_dashboard => 'My Learning Dashboard';

  @override
  String get my_learning_dashboard_description =>
      'Continue your learning journey with Coptic Hymns School';

  @override
  String get registrationDate => 'Registration Date';

  @override
  String get rateThisCourse => 'Rate this Course';

  @override
  String get thanksForYourRating => 'Thanks for your rating!';

  @override
  String get pleaseSelectARate => 'Please select a rate before submitting';

  @override
  String get youHaveAlreadyRatedThisCourse =>
      'You have already rated this course';

  @override
  String get emailNotFound => 'Email not found';

  @override
  String get somethingWentWrong => 'Something went wrong';
}
