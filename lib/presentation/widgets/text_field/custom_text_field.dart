import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../themes/theme_color.dart';
import '../../themes/theme_text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLine;
  final Key? formKey;
  final String? hintText;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Function(String)? onChange;
  final VoidCallback? onDone;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? readOnly;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final TextCapitalization? textCapitalization;
  final FormFieldValidator<String>? onValidate;
  final List<TextInputFormatter>? inputFormattter;
  final int? maxLength;
  final bool? obscureText;

  CustomTextField({
    this.controller,
    this.onValidate,
    this.focusNode,
    this.style,
    this.textInputType,
    this.suffixIcon,
    this.prefixIcon,
    this.formKey,
    this.maxLine,
    this.inputFormattter,
    this.readOnly = false,
    this.textInputAction,
    this.hintText = '',
    this.onChange,
    this.onDone,
    this.contentPadding,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.textCapitalization,
    this.maxLength,
    this.hintStyle,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.white),
      child: Stack(
        children: [
          TextFormField(
            onChanged: onChange,
            readOnly: readOnly ?? false,
            controller: controller,
            obscureText: obscureText ?? false,
            validator: onValidate,
            focusNode: focusNode,
            style: style,
            maxLength: maxLength,
            keyboardType: textInputType,
            textInputAction: textInputAction ?? TextInputAction.newline,
            onEditingComplete: onDone,
            inputFormatters: inputFormattter,
            decoration: InputDecoration(
              label: Text(hintText!),
              hintText: hintText,
              filled: true,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              fillColor: Colors.white,
              hintStyle: hintStyle ?? AppTextTheme.normalGrey,
              errorStyle: AppTextTheme.normalBlack
                  .copyWith(color: AppColors.red, fontWeight: FontWeight.w300),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.primaryColor, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(
                      vertical: contentPaddingVertical ?? 17.0,
                      horizontal: contentPaddingHorizontal ?? 16.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey4, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 0.5),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.red),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            maxLines: maxLine,
          ),
        ],
      ),
    );
  }
}
