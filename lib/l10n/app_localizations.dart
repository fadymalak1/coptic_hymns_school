import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @my_courses.
  ///
  /// In en, this message translates to:
  /// **'My Courses'**
  String get my_courses;

  /// No description provided for @explore_courses.
  ///
  /// In en, this message translates to:
  /// **'Explore Courses'**
  String get explore_courses;

  /// No description provided for @skill_up_now.
  ///
  /// In en, this message translates to:
  /// **'Skill up now'**
  String get skill_up_now;

  /// No description provided for @students_count.
  ///
  /// In en, this message translates to:
  /// **'Students Count'**
  String get students_count;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get years;

  /// No description provided for @courses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get courses;

  /// No description provided for @coptic_hymns_courses.
  ///
  /// In en, this message translates to:
  /// **'Coptic Hymns Courses'**
  String get coptic_hymns_courses;

  /// No description provided for @students.
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get students;

  /// No description provided for @register_now.
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get register_now;

  /// No description provided for @courseDetails.
  ///
  /// In en, this message translates to:
  /// **'Course Details'**
  String get courseDetails;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration:'**
  String get duration;

  /// No description provided for @weeks.
  ///
  /// In en, this message translates to:
  /// **'Weeks'**
  String get weeks;

  /// No description provided for @instructor.
  ///
  /// In en, this message translates to:
  /// **'Instructor:'**
  String get instructor;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating:'**
  String get rating;

  /// No description provided for @totalPrice.
  ///
  /// In en, this message translates to:
  /// **'Total Price:'**
  String get totalPrice;

  /// No description provided for @studentCount.
  ///
  /// In en, this message translates to:
  /// **'Student Count:'**
  String get studentCount;

  /// No description provided for @registerForCourse.
  ///
  /// In en, this message translates to:
  /// **'Register for Course'**
  String get registerForCourse;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @enterFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter Full Name'**
  String get enterFullName;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @enterEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter Email Address'**
  String get enterEmailAddress;

  /// No description provided for @phoneNumberWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'Phone Number (WhatsApp)'**
  String get phoneNumberWhatsApp;

  /// No description provided for @enterPhoneNumberWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number (WhatsApp)'**
  String get enterPhoneNumberWhatsApp;

  /// No description provided for @registrationSummary.
  ///
  /// In en, this message translates to:
  /// **'Registration Summary:'**
  String get registrationSummary;

  /// No description provided for @course.
  ///
  /// In en, this message translates to:
  /// **'Course:'**
  String get course;

  /// No description provided for @completeRegistration.
  ///
  /// In en, this message translates to:
  /// **'Complete Registration'**
  String get completeRegistration;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmail;

  /// No description provided for @invalidPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get invalidPhone;

  /// No description provided for @minLength.
  ///
  /// In en, this message translates to:
  /// **'This field must be at least {min} characters'**
  String minLength(Object min);

  /// No description provided for @maxLength.
  ///
  /// In en, this message translates to:
  /// **'This field must be less than {max} characters'**
  String maxLength(Object max);

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordMismatch;

  /// No description provided for @invalidNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number'**
  String get invalidNumber;

  /// No description provided for @minValue.
  ///
  /// In en, this message translates to:
  /// **'Value must be greater than or equal to {min}'**
  String minValue(Object min);

  /// No description provided for @maxValue.
  ///
  /// In en, this message translates to:
  /// **'Value must be less than or equal to {max}'**
  String maxValue(Object max);

  /// No description provided for @completePayment.
  ///
  /// In en, this message translates to:
  /// **'Complete Payment'**
  String get completePayment;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @instapay.
  ///
  /// In en, this message translates to:
  /// **'InstaPay'**
  String get instapay;

  /// No description provided for @mobileWallet.
  ///
  /// In en, this message translates to:
  /// **'Mobile Wallet'**
  String get mobileWallet;

  /// No description provided for @instapayUsername.
  ///
  /// In en, this message translates to:
  /// **'InstaPay Username'**
  String get instapayUsername;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @sendAmount.
  ///
  /// In en, this message translates to:
  /// **'Send {amount} EGP to this {type} and upload the receipt below'**
  String sendAmount(Object amount, Object type);

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'username'**
  String get username;

  /// No description provided for @number.
  ///
  /// In en, this message translates to:
  /// **'number'**
  String get number;

  /// No description provided for @usBankTransfer.
  ///
  /// In en, this message translates to:
  /// **'US Bank Transfer'**
  String get usBankTransfer;

  /// No description provided for @accountHolder.
  ///
  /// In en, this message translates to:
  /// **'Account Holder'**
  String get accountHolder;

  /// No description provided for @accountNumber.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get accountNumber;

  /// No description provided for @swiftCode.
  ///
  /// In en, this message translates to:
  /// **'SWIFT Code'**
  String get swiftCode;

  /// No description provided for @iban.
  ///
  /// In en, this message translates to:
  /// **'IBAN'**
  String get iban;

  /// No description provided for @bankName.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bankName;

  /// No description provided for @bankAddress.
  ///
  /// In en, this message translates to:
  /// **'Bank Address'**
  String get bankAddress;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard!'**
  String get copied;

  /// No description provided for @uploadPaymentReceipt.
  ///
  /// In en, this message translates to:
  /// **'Upload Payment Receipt'**
  String get uploadPaymentReceipt;

  /// No description provided for @clickToUploadReceipt.
  ///
  /// In en, this message translates to:
  /// **'Click to upload receipt'**
  String get clickToUploadReceipt;

  /// No description provided for @allowedFormats.
  ///
  /// In en, this message translates to:
  /// **'JPG, PNG, or JPEG'**
  String get allowedFormats;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @submitPayment.
  ///
  /// In en, this message translates to:
  /// **'Submit Payment'**
  String get submitPayment;

  /// No description provided for @paymentSubmitted.
  ///
  /// In en, this message translates to:
  /// **'Payment Submitted ✅'**
  String get paymentSubmitted;

  /// No description provided for @failedToSubmit.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit payment'**
  String get failedToSubmit;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @access_title.
  ///
  /// In en, this message translates to:
  /// **'Access Your Courses'**
  String get access_title;

  /// No description provided for @access_description.
  ///
  /// In en, this message translates to:
  /// **'Enter your registered email address to access your enrolled courses.'**
  String get access_description;

  /// No description provided for @checkAccess.
  ///
  /// In en, this message translates to:
  /// **'Check Access'**
  String get checkAccess;

  /// No description provided for @viewCourse.
  ///
  /// In en, this message translates to:
  /// **'View Course'**
  String get viewCourse;

  /// No description provided for @noCoursesFound.
  ///
  /// In en, this message translates to:
  /// **'No courses found for this email'**
  String get noCoursesFound;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
