import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../infrastructures/utils/constants.dart';

class IranianPlate extends StatefulWidget {
  final List<String> letters;
  final String? selectedLetter;
  final ValueChanged<String>? onCompleted;

  const IranianPlate({
    super.key,
    required this.letters,
    this.selectedLetter,
    this.onCompleted,
  });

  @override
  State<IranianPlate> createState() => _IranianPlateState();
}

class _IranianPlateState extends State<IranianPlate>
    with SingleTickerProviderStateMixin {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;
  late AnimationController _shakeController;
  late String? _selectedLetter;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(3, (_) => TextEditingController());
    _focusNodes = List.generate(3, (_) => FocusNode());
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _selectedLetter = widget.selectedLetter;
  }

  void _onLetterChange(String? value) {
    _selectedLetter = value;
    _checkCompletion();
  }

  void _onChanged(String value, int index, int maxLength) {
    if (value.length == maxLength && index < _controllers.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }
    _checkCompletion();
  }

  void _onBackspace(RawKeyEvent event, int index) {
    if (event.isKeyPressed(LogicalKeyboardKey.backspace) &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  void _checkCompletion() {
    final code = _controllers.map((c) => c.text).join();
    if (code.length == 7 && _selectedLetter != null) {
      widget.onCompleted?.call(code + _selectedLetter!);
    }
  }

  void triggerError() =>
      _shakeController.forward().then((_) => _shakeController.reverse());

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    _shakeController.dispose();
    super.dispose();
  }

  OutlineInputBorder _border(BuildContext context) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Theme.of(context).colorScheme.secondary,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shakeController,
      builder: (context, child) => Transform.translate(
        offset: Offset(8 * (1 - _shakeController.value), 0),
        child: child,
      ),
      child: IntrinsicHeight(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: Constants.horizontalPagePaddingSize,
          ),
          child: Row(
            spacing: AppSpacing.mediumSpace,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.ltr,
            children: [
              _flagBox(),
              _plateBox(context, 0, maxLength: 2),
              _letterDropdown(context),
              _plateBox(context, 1, maxLength: 3),
              _plateBox(context, 2, maxLength: 2),
            ],
          ),
        ),
      ),
    );
    // AppSpacing.smallHorizontalSpacer,
  }

  Widget _flagBox() => Flexible(
    flex: 2,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.pngs.iranianFlag.path,
            height: 20,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 4),
          const Text(
            'IR\nIRAN',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    ),
  );

  Widget _plateBox(BuildContext context, int index, {required int maxLength}) =>
      Flexible(
        flex: index == 1 ? 3 : 2,
        // ignore: deprecated_member_use
        child: RawKeyboardListener(
          focusNode: FocusNode(),
          onKey: (event) => _onBackspace(event, index),
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: maxLength,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(maxLength),
            ],
            decoration: InputDecoration(
              counterText: '',
              border: _border(context),
              focusedBorder: _border(context),
              enabledBorder: _border(context),
            ),
            onChanged: (val) => _onChanged(val, index, maxLength),
          ),
        ),
      );

  Widget _letterDropdown(BuildContext context) => Expanded(
    flex: 4,
    child: DropdownButtonFormField<String>(
      value: widget.selectedLetter,
      items: widget.letters
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Center(child: Text(e)),
            ),
          )
          .toList(),
      onChanged: _onLetterChange,
      decoration: InputDecoration(
        border: _border(context),
        focusedBorder: _border(context),
        enabledBorder: _border(context),
      ),
    ),
  );
}
