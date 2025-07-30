import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../infrastructures/utils/constants.dart';
import '../infrastructures/utils/spacing.dart';
import '../infrastructures/utils/validators.dart';

class CustomOtpField extends StatefulWidget {
  final int length;
  final bool enabled;
  final ValueChanged<String> onCompleted;
  final ValueChanged<String>? onChanged;
  final bool isExpired;
  final bool shouldClear;
  final Duration animationDuration;

  const CustomOtpField({
    super.key,
    required this.onCompleted,
    required this.shouldClear,
    this.isExpired = false,
    this.length = 6,
    this.onChanged,
    this.enabled = true,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  @override
  State<CustomOtpField> createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField>
    with SingleTickerProviderStateMixin {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  late AnimationController _animationController;
  late Animation<double> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());

    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _offsetAnimation = Tween<double>(
      begin: 0,
      end: 12,
    ).chain(CurveTween(curve: Curves.elasticIn)).animate(_animationController);

    _focusNodes.first.requestFocus();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    final code = _controllers.map((c) => c.text).join();
    widget.onChanged?.call(code);
    if (code.length == widget.length) {
      widget.onCompleted(code);
    }
  }

  void _onPaste(String text) {
    if (text.length == widget.length) {
      for (int i = 0; i < widget.length; i++) {
        _controllers[i].text = text[i];
      }
      _focusNodes.last.requestFocus();
      widget.onCompleted(text);
    }
  }

  @override
  void didUpdateWidget(covariant CustomOtpField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpired && !oldWidget.isExpired) {
      _animationController.forward().then(
        (_) => _animationController.reverse(),
      );
    }
    if (widget.shouldClear && !oldWidget.shouldClear) {
      for (final c in _controllers) {
        c.clear();
      }
      Future.delayed(Duration(milliseconds: 50), () {
        if (mounted) {
          _focusNodes.first.requestFocus();
        }
        widget.onChanged?.call('');
      });
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.isExpired
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.secondary;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Transform.translate(
        offset: Offset(_offsetAnimation.value, 0),
        child: child,
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Constants.textFiledRadius),
            border: Border.all(color: borderColor),
          ),
          child: Padding(
            padding: AppSpacing.largePadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (i) => SizedBox(
                  width: 40,
                  child: TextFormField(
                    controller: _controllers[i],
                    focusNode: _focusNodes[i],
                    enabled: widget.enabled,
                    validator: (value) => Validators.otpValidator(value),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    maxLength: 1,
                    style: Theme.of(context).textTheme.bodyMedium,
                    cursorColor: Theme.of(context).colorScheme.secondary,
                    onChanged: (val) => _onChanged(val, i),
                    onTap: () async {
                      final ClipboardData? data = await Clipboard.getData(
                        'text/plain',
                      );
                      if (data?.text != null &&
                          data!.text!.length == widget.length) {
                        _onPaste(data.text!);
                      }
                    },
                    decoration: InputDecoration(
                      counterText: '',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSecondary,
                          width: 2,
                        ),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSecondary,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
