import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  final bool enableInteractiveSelection;
  final bool readOnly;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final String labelText;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final String? helperText;
  final bool? obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final Color? cursorColor;
  final Color? prefixIconColor;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FloatingLabelBehavior? floatingLabelBehavior;
  const AppTextFormField(
      {super.key,
      this.readOnly = false,
      this.maxLines = 1,
      this.enableInteractiveSelection = true,
      this.textCapitalization = TextCapitalization.none,
      this.labelText = '',
      this.floatingLabelBehavior = FloatingLabelBehavior.auto,
      this.keyboardType = TextInputType.text,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.inputTextStyle,
      this.hintStyle,
      this.helperText,
      this.hintText = '',
      this.obscureText,
      this.prefixIcon,
      this.suffixIcon,
      this.backgroundColor,
      this.cursorColor,
      this.prefixIconColor,
      this.controller,
      this.validator,
      this.onChanged,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      enabled: readOnly ? false : true,
      enableInteractiveSelection: enableInteractiveSelection,
      textCapitalization: textCapitalization,
      controller: controller,
      keyboardType: keyboardType,
      // cursorColor: cursorColor ?? AppColorTheme.primaryColor,
      textAlignVertical: TextAlignVertical.center,
      maxLines: maxLines,
      decoration: InputDecoration(
        floatingLabelBehavior: floatingLabelBehavior,
        labelStyle: TextStyle(
            //   color: readOnly ? Colors.grey[600] : AppColorTheme.textSecondaryColor,
            ),
        labelText: labelText,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        prefixIconConstraints: BoxConstraints(
          minWidth: 48,
          minHeight: 48,
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 48,
          minHeight: 48,
        ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                // color: AppColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xFF455A64),
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  8.0,
                ),
              ),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFF455A64),
            width: 0.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              8.0,
            ),
          ),
        ),
        //  hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        helperText: helperText,
        //helperStyle: TextStyles.font10GreyMedium,
        //TextStyles.font14GreyMedium,
        helperMaxLines: 3,
        errorMaxLines: 3,
        // errorStyle: TextStyles.font14RedMedium,
        filled: readOnly ? true : false,
        fillColor: Colors.grey[200],
      ),
      obscureText: obscureText ?? false,
      //style: TextStyles.font14GreyMedium,
      validator: (text) {
        return validator != null ? validator!(text) : null;
      },
      onChanged: onChanged,
      inputFormatters: inputFormatters,
    );
  }
}
