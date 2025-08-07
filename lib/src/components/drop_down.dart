import 'package:flutter/material.dart';
import 'package:taxi_4030/src/infrastructures/utils/spacing.dart';

typedef ItemAsString<T> = String Function(T item);
typedef OnChanged<T> = void Function(T?)?;

class CustomDropDown<T> extends StatefulWidget {
  const CustomDropDown({
    super.key,
    this.title,
    required this.items,
    required this.getTitle,
    required this.value,
    this.onSelectItem,
    this.hint,
    this.onClear,
    this.defaultIcon = false,
  });

  final String? title;
  final List<T> items;
  final String? hint;
  final bool defaultIcon;
  final ItemAsString<T> getTitle;
  final OnChanged<T>? onSelectItem;
  final T? value;
  final VoidCallback? onClear;

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  @override
  Widget build(BuildContext context) => Padding(
    padding: AppSpacing.mediumPadding,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(widget.title!, style: Theme.of(context).textTheme.bodyMedium),
          AppSpacing.mediumVerticalSpacer,
        ],
        SizedBox(width: double.infinity, height: 44, child: _decoration()),
      ],
    ),
  );

  Widget _decoration() => DecoratedBox(
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        strokeAlign: BorderSide.strokeAlignOutside,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(AppSpacing.mediumSpace),
      ),
    ),
    child: _dropdown(),
  );

  Widget _dropdown() => DropdownButtonHideUnderline(
    child: DropdownButton<T>(
      elevation: 1,
      hint: widget.hint != null
          ? Text(
              '${widget.hint}',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          : null,
      padding: EdgeInsetsGeometry.symmetric(horizontal: AppSpacing.largeSpace),
      iconEnabledColor: Colors.black,
      icon: widget.value != null && !widget.defaultIcon
          ? InkWell(
              onTap: widget.onClear,
              child: Icon(
                Icons.clear,
                size: AppSpacing.xLargeSpace,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )
          : Icon(
              Icons.keyboard_arrow_down,
              size: AppSpacing.xLargeSpace,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
      menuMaxHeight: 200,
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      value: widget.value,
      style: Theme.of(context).textTheme.bodyMedium,
      onChanged: (T? value) {
        if (widget.onSelectItem != null) {
          widget.onSelectItem!(value);
        }
      },
      items: <T>[...widget.items]
          .map<DropdownMenuItem<T>>(
            (T value) => DropdownMenuItem<T>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.getTitle(value),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          )
          .toList(),
    ),
  );
}
