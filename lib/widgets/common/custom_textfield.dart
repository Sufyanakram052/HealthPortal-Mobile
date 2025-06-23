import 'package:flutter/services.dart';
import 'package:htca_app/constants/exports.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.controller,
      this.onChanged,
      this.showBorder = true,
      this.readOnly = false,
      this.autofocus = false,
      this.isObscure = false,
      this.isPasswordField = false,
      this.textCapitalization = TextCapitalization.sentences,
      this.onFieldSubmitted,
      this.inputFormatters,
      this.onEditingComplete,
      this.textInputAction,
      this.keyboardType,
      this.validator,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.labelText,
      this.minLines,
      this.maxLines,
      this.maxLength = 50,
      this.onTap,
      this.onSuffixTap,
      this.focusNode,
      this.style,
      this.title,
      this.labelStyle,
      this.autoUnFocusEnable = true,
      this.areaPadding,
      this.borderRadius,
      this.filledColor,
      this.borderColor,
      this.contentPadding,
      this.initialValue = '',
      this.floatingLabelBehavior,
      this.errorText,
      this.hintStyle});

  final TextEditingController? controller;
  final bool isObscure,
      isPasswordField,
      readOnly,
      showBorder,
      autoUnFocusEnable,
      autofocus;
  final TextCapitalization textCapitalization;
  final String? hintText, labelText, title, errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final VoidCallback? onTap, onSuffixTap, onEditingComplete;
  final Widget? suffixIcon, prefixIcon;
  final int? minLines, maxLines, maxLength;
  final TextStyle? style, labelStyle, hintStyle;
  final double? borderRadius;
  final Color? filledColor, borderColor;
  final FocusNode? focusNode;
  final EdgeInsets? areaPadding, contentPadding;
  final FloatingLabelBehavior? floatingLabelBehavior;
  String? initialValue;
  static void unFocus() {
    bool keyboardVisible = Get.context?.mediaQueryViewInsets.bottom != 0;
    if (keyboardVisible) Get.focusScope?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: areaPadding ?? const EdgeInsets.symmetric(vertical: 12).r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            title,
            fontSize: 20,
            color: AppColors.primaryTextColor,
          ),
          TextFormField(
            onTap: onTap,

            autofocus: autofocus,
            //autofocus,
            obscuringCharacter: '*',
            controller: controller,
            onChanged: onChanged,
            focusNode: focusNode,
            readOnly: readOnly,
            obscureText: isObscure,
            minLines: minLines,
            maxLength: maxLength ?? 50,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            maxLines: isPasswordField ? 1 : maxLines ?? 1,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            textCapitalization: textCapitalization,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            validator: validator ??
                (String? text) {
                  if (text?.trim().isEmpty == true) {
                    String? pleaseEnter = AppStrings.pleaseEnter.tr;
                    String label = (labelText ?? '').toLowerCase();

                    return "$pleaseEnter $label";
                  }
                  return null;
                },
            style: style ??
                Helper.textStyle(
                  fontWeight: FontWeight.normal,
                  size: 16,
                ),
            decoration: InputDecoration(
              hintText: hintText?.tr,
              labelText: labelText?.tr,
              suffixIcon: suffixIcon ?? _showPasswordIcon(),
              prefixIcon: prefixIcon,
              errorText: errorText,
              hintStyle: hintStyle ??
                  Helper.textStyle(fontWeight: FontWeight.normal, size: 16.sp),
              labelStyle: labelStyle ??
                  Helper.textStyle(
                      size: 14.sp, color: AppColors.primaryTextColor),
              errorStyle: Helper.textStyle(size: 12.sp),
              errorMaxLines: 2,
              counterText: '',
              fillColor: filledColor,
              filled: filledColor != null,

              border: _border(context,
                  borderRadius: borderRadius, borderColor: borderColor),
              focusedBorder: _border(context,
                  borderRadius: borderRadius, borderColor: borderColor),
              enabledBorder: _border(context,
                  borderRadius: borderRadius, borderColor: borderColor),
              disabledBorder: _border(context,
                  borderRadius: borderRadius, borderColor: borderColor),
              errorBorder: _border(context,
                  borderColor: context.error, borderRadius: borderRadius),
              focusedErrorBorder: _border(context,
                  borderColor: context.error, borderRadius: borderRadius),
              contentPadding: contentPadding,
              floatingLabelBehavior:
                  floatingLabelBehavior, //minLines != null ? FloatingLabelBehavior.always : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget? _showPasswordIcon() {
    if (isPasswordField) {
      return IconButton(
        onPressed: onSuffixTap,
        icon: Icon(
          isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: AppColors.lightGrey.withOpacity(0.3),
        ),
      );
    } else {
      return null;
    }
  }

  InputBorder _border(BuildContext context,
      {Color? borderColor, double? borderRadius}) {
    if (showBorder) {
      return OutlineInputBorder(
        borderSide: BorderSide(
          color: borderColor ?? context.onSecondary.withOpacity(0.5),
          width: 1.0.sp,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? 8.sp),
        ),
      );
    } else {
      return InputBorder.none;
    }
  }
}
