import 'package:flutter/material.dart';
import 'package:taxi_4030/src/infrastructures/theme/spacing.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({
    super.key,
    required this.title,
    required this.textController,
    this.hint,
  });

  final String title;
  final String? hint;
  final TextEditingController textController;

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) => Padding(
    padding: AppSpacing.mediumPadding,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: AppSpacing.largeSpace,
          ),
        ),
        AppSpacing.largeHorizontalSpacer,
        Expanded(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.white, width: 0.5),
              ),
            ),
            child: TextFormField(
              controller: widget.textController,
              showCursor: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.primary,
                hintText: widget.hint ?? "",
                hintStyle: const TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w100,
                ),
                suffixIcon: const Icon(
                  Icons.search_outlined,
                  color: Colors.white54,
                  size: AppSpacing.largeSpace,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
