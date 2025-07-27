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

  static String? iranMobileValidator(String? value) {
    if (value == null || value.isEmpty) return 'شماره همراه را وارد کنید';
    final regex = RegExp(r'^[9][0-9]{9}$');
    if (!regex.hasMatch(value)) return 'شماره همراه معتبر نیست';

    if (value.startsWith('9') && (value.length == 10)) {
      return null;
    }
    return 'شماره همراه معتبر نیست';
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
