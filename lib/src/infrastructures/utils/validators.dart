class Validators {
  static String? validateFirstName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'نام نمی‌تواند خالی باشد';
    }
    final name = value.trim();

    if (name.length < 3) {
      return 'نام باید حداقل ۳ کاراکتر باشد';
    }
    if (name.length > 50) {
      return 'نام نمیتواند بیشتر از 50 کارکتر باشد';
    }
    final regex = RegExp(r'^[آابپتثجچحخدذرزژسشصضطظعغفقکگلمنوهی\s]+$');
    if (!regex.hasMatch(name)) {
      return 'نام فقط می‌تواند شامل حروف فارسی باشد';
    }

    if (name.contains(RegExp(r'\s{2,}'))) {
      return 'فاصله‌های متوالی مجاز نیست';
    }

    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'نام خانوادگی نمی‌تواند خالی باشد';
    }
    final lastName = value.trim();

    if (lastName.length < 3) {
      return 'نام خانوادگی باید حداقل ۳ کاراکتر باشد';
    }

    final regex = RegExp(r'^[آابپتثجچحخدذرزژسشصضطظعغفقکگلمنوهی\s]+$');
    if (!regex.hasMatch(lastName)) {
      return 'نام خانوادگی فقط می‌تواند شامل حروف فارسی باشد';
    }

    if (lastName.contains(RegExp(r'\s{2,}'))) {
      return 'فاصله‌های متوالی مجاز نیست';
    }

    if (lastName.length < 4 && !lastName.contains(' ')) {
      return 'نام خانوادگی وارد شده معتبر نیست';
    }

    return null;
  }

  static String? nationalCodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'کد ملی را وارد کنید';
    }
    if (value.isValidIranNationalCode()) {
      return null;
    }

    return 'کد ملی نامعتبر است';
  }

  static String? validateDate({String? day, String? month, String? year}) {
    final dayValue = int.tryParse(day ?? '');
    final monthValue = int.tryParse(month ?? '');
    final yearValue = int.tryParse(year ?? '');

    if (dayValue == null || monthValue == null || year == null) {
      return 'لطفاً تاریخ کامل را وارد کنید';
    }
    if (dayValue < 1 || dayValue > 31) return 'روز باید بین 1 تا 31 باشد';
    if (monthValue < 1 || monthValue > 12) return 'ماه باید 1 تا 12 ماه باشد';
    // if (year < widget.minYear || year > widget.maxYear) {
    //   return 'سال باید بین ${widget.minYear} و ${widget.maxYear} باشد';
    // }
    return null;
  }

  static String? iranMobileValidator(String? value) {
    if (value == null || value.isEmpty) return 'شماره همراه را وارد کنید';
    final regex = RegExp(r'^[9][0-9]{9}$');
    if (!regex.hasMatch(value)) return 'شماره همراه معتبر نیست';

    if (value.startsWith('9') && (value.length == 10)) {
      return null;
    }
    return 'شماره همراه معتبر نیست';
  }

  static String? nationalIdValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'شماره شناسنامه نمی‌تواند خالی باشد';
    }

    final numeric = RegExp(r'^\d+$');
    if (!numeric.hasMatch(value)) {
      return 'شماره شناسنامه باید فقط شامل اعداد باشد';
    }

    if (value.length > 10) {
      return 'شماره شناسنامه باید بین 1 تا 10 رقم باشد';
    }

    return null;
  }

  static String? validateCityActivity(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'لطفاً نام شهر را وارد کنید';
    }
    final regex = RegExp(r'^[آ-ی\s]+$');
    if (!regex.hasMatch(value.trim())) {
      return 'نام شهر باید فقط شامل حروف فارسی باشد';
    }
    if (value.trim().length < 2) {
      return 'نام شهر معتبر نیست';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'لطفاً آدرس را وارد کنید';
    }
    if (value.trim().length < 10) {
      return 'آدرس باید حداقل ۱۰ کاراکتر باشد';
    }
    return null;
  }

  static String? validateReferralCode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    final regex = RegExp(r'^\d{5,6}$');
    if (!regex.hasMatch(value.trim())) {
      return 'کد معرف باید عددی و ۵ یا ۶ رقمی باشد';
    }
    return null;
  }

  /// this is for one by one of them
  static String? otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'نامعتبر';
    }

    final regex = RegExp(r'^[9][0-9]{9}$');
    if (!regex.hasMatch(value)) return 'عدد نامعتبر';

    final double? price = double.tryParse(value);
    if (price == null) {
      return 'عدد نامعتبر';
    } else if (price < 0) {
      return 'عدد نامعتبر';
    }

    return null;
  }
}

extension NationalCode on String? {
  bool isValidIranNationalCode() {
    const int nationalCodeLength = 10;

    final nationalCode = this;
    if (nationalCode == null ||
        nationalCode.length != nationalCodeLength ||
        int.tryParse(nationalCode) == null) {
      return false;
    }

    var j = nationalCodeLength;
    var sum = 0;
    for (int i = 0; i < nationalCode.length - 1; i++) {
      sum += int.parse(nationalCode[i]) * j--;
    }

    final remainder = sum % 11;
    final controlNumber = int.parse(nationalCode[9]);

    return remainder < 2 && controlNumber == remainder ||
        remainder >= 2 && controlNumber == 11 - remainder;
  }
}
