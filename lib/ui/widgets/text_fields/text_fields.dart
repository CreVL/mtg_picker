import 'package:flutter/material.dart';
import 'package:mtg_picker/ui/resurces/app_colors.dart';
import 'package:mtg_picker/ui/widgets/text_fields/custom_text_field.dart';

class TextFields {
  static Widget search({
    required BuildContext context,
    TextEditingController? textEditingController,
    Function(String text)? onSubmitted,
    Function(String text)? onChanged,
    Widget? trailing,
  }) {
    return CustomTextField(
      controller: textEditingController,
      style: const TextStyle(fontFamily: 'serif'),
      idleLabelStyle: const TextStyle(fontFamily: 'serif'),
      idleBackgroundColor: AppColors.brown_0,
      focusBackgroundColor: AppColors.brown_0,
      cursorColor: AppColors.brown_0,
      hintText: "Search...",
      hintStyle: const TextStyle(fontFamily: 'serif'),
      prefix: const SizedBox(
        width: 5,
      ),
      trailing: trailing,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
    );
  }
}
