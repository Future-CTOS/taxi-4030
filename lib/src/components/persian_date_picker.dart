// Persian Date Picker (No Packages, Leap Year & Validation Support with Age Limit Option)

import 'package:flutter/material.dart';

class PersianDatePicker extends StatefulWidget {
  final void Function(DateTime? selectedDate) onDateSelected;
  final DateTime? initialDate;
  final bool restrictUnder18;

  const PersianDatePicker({
    super.key,
    required this.onDateSelected,
    this.initialDate,
    this.restrictUnder18 = false,
  });

  @override
  State<PersianDatePicker> createState() => _PersianDatePickerState();
}

class _PersianDatePickerState extends State<PersianDatePicker> {
  int? selectedYear;
  int? selectedMonth;
  int? selectedDay;

  late final List<int> years;
  final List<String> months = [
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند',
  ];

  @override
  void initState() {
    final now = widget.initialDate ?? DateTime.now();
    final jalali = _gregorianToJalali(now);
    final currentJalali = _gregorianToJalali(DateTime.now());

    years = List.generate(100, (i) => currentJalali[0] - i).where((y) {
      if (!widget.restrictUnder18) return true;
      final birthGregorian = _jalaliToGregorian(
        y,
        currentJalali[1],
        currentJalali[2],
      );
      final birthDate = DateTime(
        birthGregorian[0],
        birthGregorian[1],
        birthGregorian[2],
      );
      final now = DateTime.now();
      final diff = now.difference(birthDate);
      return diff.inDays >= (18 * 365.25);
    }).toList();

    selectedYear = jalali[0];
    selectedMonth = jalali[1];
    selectedDay = jalali[2];

    if (widget.restrictUnder18) {
      final birthGregorian = _jalaliToGregorian(
        selectedYear!,
        selectedMonth!,
        selectedDay!,
      );
      final age = DateTime.now().difference(
        DateTime(birthGregorian[0], birthGregorian[1], birthGregorian[2]),
      );
      if (age.inDays < (18 * 365.25)) {
        selectedYear = years.first;
      }
    }

    super.initState();
  }

  List<int> getDaysInMonth(int year, int month) {
    if (month <= 6) return List.generate(31, (i) => i + 1);
    if (month <= 11) return List.generate(30, (i) => i + 1);
    return _isLeapYear(year)
        ? List.generate(30, (i) => i + 1)
        : List.generate(29, (i) => i + 1);
  }

  bool _isLeapYear(int year) {
    final mod = year % 33;
    return [1, 5, 9, 13, 17, 22, 26, 30].contains(mod);
  }

  void _onChanged() {
    if (!_validateDate()) return;
    final gregorian = _jalaliToGregorian(
      selectedYear!,
      selectedMonth!,
      selectedDay!,
    );
    widget.onDateSelected(DateTime(gregorian[0], gregorian[1], gregorian[2]));
  }

  bool _validateDate() {
    final days = getDaysInMonth(selectedYear!, selectedMonth!);
    return days.contains(selectedDay);
  }

  Widget _buildDropDown<T>({
    required List<T> items,
    required T? value,
    required String hint,
    required ValueChanged<T?> onChanged,
  }) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      border: Border.all(color: Theme.of(context).colorScheme.secondary),
      borderRadius: BorderRadius.circular(8),
    ),
    child: DropdownButton<T>(
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      value: value,
      hint: Text(
        hint,
        textDirection: TextDirection.rtl,
        style: const TextStyle(color: Colors.grey),
      ),
      underline: const SizedBox(),
      isDense: true,
      icon: const Icon(Icons.arrow_drop_down),
      onChanged: onChanged,
      items: items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item.toString(), textDirection: TextDirection.rtl),
        );
      }).toList(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final validMonth = selectedMonth ?? 1;
    final validYear = selectedYear ?? 1400;
    final days = getDaysInMonth(validYear, validMonth);
    if (selectedDay != null && !days.contains(selectedDay)) {
      selectedDay = days.last;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDropDown(
          items: days,
          value: selectedDay,
          hint: 'روز',
          onChanged: (value) {
            setState(() => selectedDay = value);
            if (selectedYear != null &&
                selectedMonth != null &&
                selectedDay != null) {
              _onChanged();
            }
          },
        ),
        _buildDropDown(
          items: months,
          value: selectedMonth != null ? months[selectedMonth! - 1] : null,
          hint: 'ماه',
          onChanged: (value) {
            setState(() => selectedMonth = months.indexOf(value!) + 1);
            if (selectedYear != null &&
                selectedMonth != null &&
                selectedDay != null) {
              _onChanged();
            }
          },
        ),
        _buildDropDown(
          items: years,
          value: selectedYear,
          hint: 'سال',
          onChanged: (value) {
            setState(() => selectedYear = value);
            if (selectedYear != null &&
                selectedMonth != null &&
                selectedDay != null) {
              _onChanged();
            }
          },
        ),
      ],
    );
  }

  /// Convert Gregorian DateTime to Jalali using simple approximation (not exact)
  List<int> _gregorianToJalali(DateTime date) {
    final gYear = date.year;
    final gMonth = date.month;
    final gDay = date.day;
    final jYear = gYear - 621;
    final jMonth = gMonth;
    final jDay = gDay;
    return [jYear, jMonth, jDay];
  }

  /// Convert Jalali to Gregorian (approximate)
  List<int> _jalaliToGregorian(int jYear, int jMonth, int jDay) {
    final gYear = jYear + 621;
    final gMonth = jMonth;
    final gDay = jDay;
    return [gYear, gMonth, gDay];
  }
}
