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

  static String? validateNationalCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'کد ملی نمی‌تواند خالی باشد';
    }

    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return 'کد ملی معتبر نیست';
    }

    if (RegExp(r'^(\d)\1{9}$').hasMatch(value)) {
      return 'کد ملی معتبر نیست';
    }

    final List<int> digits = value.split('').map(int.parse).toList();
    final checkDigit = digits[9];
    int sum = 0;

    for (int i = 0; i < 9; i++) {
      sum += digits[i] * (10 - i);
    }

    final remainder = sum % 11;
    if (!((remainder < 2 && checkDigit == remainder) ||
        (remainder >= 2 && checkDigit == (11 - remainder)))) {
      return 'کد ملی معتبر نیست';
    }

    return null;
  }
}
