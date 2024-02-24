import 'package:flutter/material.dart';

class DefaultFormFieldLogin extends StatelessWidget {
  final FocusNode? focusNode;
  final String? helperText;
  final TextStyle? helperStyle;
  final String? errorText;
  final TextStyle? errorTextStyle;
  final TextEditingController controller;
  final String? Function(String?) validator;
  // final VoidCallback? onTap;
  final Function()? onTap;
  final String? labelText;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final bool obscureText;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final String? hintText;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final Color? backgroundColor;
  final Color? textColor;
  // final Color? labelColor;
  final Color? cursorColor;
  final double radius;
  final double? height;
  final int? maxLines;
  final double horizontalPadding;
  final InputBorder? inputBorder;
  final InputBorder? inputEnabledBorder;
  final InputBorder? inputFocusedBorder;
  final InputBorder? inputDisabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final AlignmentGeometry? containerAlignment;
  final BoxConstraints? suffixIconConstraints;
  final bool readOnly;
  final int? maxLength;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final Color? prefixIconColor;
  final Color? suffixIconColor;


  const DefaultFormFieldLogin({
    Key? key,
    this.focusNode,
    this.helperText,
     this.helperStyle,
     this.errorText,
     this.errorTextStyle,
    required this.controller,
    required this.validator,
    this.onTap,
    this.labelText,
    this.keyboardType,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onChanged,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
    this.hintText,
    this.backgroundColor,
    this.height,
    this.radius = 5.0,
    this.maxLines,
    this.enabled = true,
    this.inputBorder = const OutlineInputBorder(borderSide: BorderSide.none),
    this.inputEnabledBorder,
    this.inputFocusedBorder,
    this.inputDisabledBorder,
    this.horizontalPadding = 0,
    this.textColor,

    // this.labelColor = ,
    this.contentPadding,
    this.containerAlignment,
    this.suffixText,
    this.suffixTextStyle,
    this.suffixIconConstraints,
    this.readOnly = false,
    this.cursorColor,
    this.maxLength,
    this.textDirection = TextDirection.ltr,
    this.textAlign = TextAlign.start,
    this.textInputAction = TextInputAction.next, this.prefixIconColor, this.suffixIconColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      onTap: onTap,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xffD1D5DB),
        ),
        prefixIcon: prefixIcon,
        prefixIconColor:prefixIconColor,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        helperText: helperText,
        helperStyle: helperStyle,
        errorStyle:helperStyle,

          // iconColor: Colors.red,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffD1D5DB)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xff3366FF)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffFF472B)),
        ),
      ),
      focusNode: focusNode,
    );
  }
}
