// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get home => 'الرئيسية';

  @override
  String get my_courses => 'كورساتي';

  @override
  String get explore_courses => 'استكشف الكورسات';

  @override
  String get skill_up_now => 'طوّر مهاراتك دلوقتي';

  @override
  String get students_count => 'عدد الطلاب';

  @override
  String get experience => 'خبرة';

  @override
  String get years => 'سنوات';

  @override
  String get courses => 'كورسات';

  @override
  String get coptic_hymns_courses => 'كورسات الألحان القبطية';

  @override
  String get students => 'طلاب';

  @override
  String get register_now => 'سجل الآن';

  @override
  String get courseDetails => 'تفاصيل الكورس';

  @override
  String get duration => 'المدة:';

  @override
  String get weeks => 'أسبوع';

  @override
  String get instructor => 'المعلم:';

  @override
  String get rating => 'التقييم:';

  @override
  String get totalPrice => 'السعر:';

  @override
  String get studentCount => 'عدد الطلاب:';

  @override
  String get registerForCourse => 'سجل الكورس';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get enterFullName => 'أدخل الاسم الكامل';

  @override
  String get emailAddress => 'البريد الإلكتروني';

  @override
  String get enterEmailAddress => 'أدخل البريد الإلكتروني';

  @override
  String get phoneNumberWhatsApp => 'رقم الهاتف (واتساب)';

  @override
  String get enterPhoneNumberWhatsApp => 'أدخل رقم الهاتف';

  @override
  String get registrationSummary => 'ملخص التسجيل:';

  @override
  String get course => 'كورس:';

  @override
  String get completeRegistration => 'اكمل التسجيل';

  @override
  String get fieldRequired => 'هذا الحقل مطلوب';

  @override
  String get invalidEmail => 'من فضلك أدخل بريد إلكتروني صحيح';

  @override
  String get invalidPhone => 'من فضلك أدخل رقم هاتف صحيح';

  @override
  String minLength(Object min) {
    return 'هذا الحقل يجب أن يكون على الأقل $min حروف';
  }

  @override
  String maxLength(Object max) {
    return 'هذا الحقل يجب أن يكون أقل من $max حروف';
  }

  @override
  String get passwordMismatch => 'كلمة المرور غير متطابقة';

  @override
  String get invalidNumber => 'من فضلك أدخل رقم صحيح';

  @override
  String minValue(Object min) {
    return 'القيمة يجب أن تكون أكبر من أو تساوي $min';
  }

  @override
  String maxValue(Object max) {
    return 'القيمة يجب أن تكون أقل من أو تساوي $max';
  }
}
