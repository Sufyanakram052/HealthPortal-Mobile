import 'package:htca_app/constants/exports.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.onChanged,
    this.showBorder = true,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.labelText,
    this.onTap,
    this.onSuffixTap,
    this.style,
    this.labelStyle,
    this.borderRadius,
    this.filledColor,
    this.borderColor,
    this.contentPadding,
    this.dropdownItems = const [],
    this.selectedValue,
  });

  final bool showBorder;
  final String? labelText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final VoidCallback? onTap, onSuffixTap;
  final Widget? suffixIcon, prefixIcon;
  final TextStyle? style, labelStyle;
  final double? borderRadius;
  final Color? filledColor, borderColor;
  final EdgeInsets? contentPadding;

  final List<String> dropdownItems;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
          labelText: labelText?.tr,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintStyle:
              Helper.textStyle(fontWeight: FontWeight.normal, size: 16.sp),
          labelStyle: labelStyle ??
              Helper.textStyle(size: 14.sp, color: context.onSecondary),
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
          contentPadding: contentPadding),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          isExpanded: true,
          items: dropdownItems
              .map(
                (String val) => DropdownMenuItem(
                  value: val,
                  child: TextWidget(
                    val,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: context.onSecondary,
                  ),
                ),
              )
              .toList(),
          hint: const TextWidget(AppStrings.selectAll),
          onChanged: onChanged,
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
          ), // Dropdown arrow icon
        ),
      ),
    );
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
