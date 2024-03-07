import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Color? idleBackgroundColor;
  final Color? focusBackgroundColor;
  final Color? errorBackgroundColor;
  final Color? errorFocusBackgroundColor;
  final Color? idleBorderColor;
  final Color? focusBorderColor;
  final Color? errorBorderColor;
  final Color? errorFocusBorderColor;
  final String? errorMessageText;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool readOnly;
  final TextStyle style;
  final TextStyle? idleLabelStyle;
  final TextStyle? idleFloatingLabelStyle;
  final TextStyle? errorMessageStyle;
  final TextStyle? errorLabelStyle;
  final TextStyle? errorFloatingLabelStyle;
  final Color? cursorColor;
  final Widget? prefix;
  final Widget? trailing;
  final Widget? errorTrailing;
  final EdgeInsets? contentPadding;
  final int? maxLines;
  final Function(String text)? onChanged;
  final Function(String text)? onSubmitted;
  final Function()? onTap;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    this.label,
    required this.style,
    this.idleLabelStyle,
    this.idleFloatingLabelStyle,
    this.controller,
    this.focusNode,
    this.errorMessageText,
    this.errorMessageStyle,
    this.errorLabelStyle,
    this.errorFloatingLabelStyle,
    this.idleBackgroundColor,
    this.focusBackgroundColor,
    this.errorBackgroundColor,
    this.errorFocusBackgroundColor,
    this.idleBorderColor,
    this.focusBorderColor,
    this.errorBorderColor,
    this.errorFocusBorderColor,
    this.hintText,
    this.hintStyle,
    this.cursorColor,
    this.contentPadding,
    this.maxLines = 1,
    this.prefix,
    this.trailing,
    this.errorTrailing,
    this.readOnly = false,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.keyboardType,
  })  : assert(
          errorMessageText == null ||
              errorMessageStyle != null && errorLabelStyle != null,
        );

  @override
  Widget build(BuildContext context) {
    final hasError = errorMessageText != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              if (prefix != null)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 8,
                    right: 0,
                  ),
                  child: prefix!,
                ),
              Expanded(
                child: TextField(
                  style: style,
                  controller: controller,
                  readOnly: readOnly,
                  cursorColor: cursorColor,
                  onChanged: onChanged,
                  onSubmitted: onSubmitted,
                  keyboardType: keyboardType,
                  onTap: onTap,
                  canRequestFocus: true,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    labelText: label,
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: hintStyle,
                    contentPadding: contentPadding,
                    isDense: true,
                  ),
                ),
              ),
              if (hasError && errorTrailing != null)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                    left: 8,
                  ),
                  child: errorTrailing,
                )
              else if (trailing != null)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                    left: 8,
                  ),
                  child: trailing!,
                ),
            ],
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
              left: 16,
            ),
            child: Text(
              errorMessageText!,
              style: errorMessageStyle,
            ),
          ),
      ],
    );
  }

  factory CustomTextField.readOnly({
    Key? key,
    String? label,
    required String text,
    FocusNode? focusNode,
    Color? idleBackgroundColor,
    Color? focusBackgroundColor,
    Color? errorBackgroundColor,
    Color? errorFocusBackgroundColor,
    Color? idleBorderColor,
    Color? focusBorderColor,
    Color? errorBorderColor,
    Color? errorFocusBorderColor,
    String? errorMessageText,
    Color? errorIconColor,
    required TextStyle style,
    required TextStyle idleLabelStyle,
    TextStyle? idleFloatingLabelStyle,
    TextStyle? errorMessageStyle,
    TextStyle? errorLabelStyle,
    TextStyle? errorFloatingLabelStyle,
    Color? cursorColor,
    String? hintText,
    TextStyle? hintStyle,
    Widget? trailing,
    Widget? errorTrailing,
    Widget? prefix,
    int? maxLines,
    EdgeInsets? contentPadding,
    Function(String text)? onChanged,
    Function(String text)? onSubmitted,
    Function()? onTap,
  }) {
    final controller = TextEditingController(text: text);
    return CustomTextField(
      key: key,
      label: label,
      focusNode: focusNode,
      controller: controller,
      idleBackgroundColor: idleBackgroundColor,
      focusBackgroundColor: focusBackgroundColor,
      errorBackgroundColor: errorBackgroundColor,
      errorFocusBackgroundColor: errorFocusBackgroundColor,
      idleBorderColor: idleBorderColor,
      focusBorderColor: focusBorderColor,
      errorBorderColor: errorBorderColor,
      errorFocusBorderColor: errorFocusBorderColor,
      errorMessageText: errorMessageText,
      errorTrailing: errorTrailing,
      readOnly: true,
      contentPadding: contentPadding,
      style: style,
      idleLabelStyle: idleLabelStyle,
      idleFloatingLabelStyle: idleFloatingLabelStyle,
      errorMessageStyle: errorMessageStyle,
      errorLabelStyle: errorLabelStyle,
      errorFloatingLabelStyle: errorFloatingLabelStyle,
      cursorColor: cursorColor,
      hintText: hintText,
      hintStyle: hintStyle,
      trailing: trailing,
      prefix: prefix,
      maxLines: maxLines,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTap: onTap,
    );
  }
}
