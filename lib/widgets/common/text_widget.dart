import 'package:htca_app/constants/exports.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(this.text,
      {super.key,
      this.textAlign,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.isUnderlined = false,
      this.onTap,
      this.maxLines,
      this.underLineColor});

  final String? text;
  final double? fontSize;
  final TextAlign? textAlign;
  final Color? color, underLineColor;
  final FontWeight? fontWeight;
  final bool isUnderlined;
  final VoidCallback? onTap;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        (text ?? '').tr,
        textAlign: textAlign,
        textScaler: TextScaler.linear(1.0.sp),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: Helper.textStyle(
          color: color,
          size: fontSize,
          fontWeight: fontWeight,
        ).copyWith(
          decoration: isUnderlined ? TextDecoration.underline : null,
          decorationColor: underLineColor,
        ),
      ),
    );
  }
}
