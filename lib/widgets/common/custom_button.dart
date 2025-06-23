import 'package:htca_app/constants/exports.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title,
    this.width,
    this.height,
    this.onPressed,
    this.outlinedColor,
    this.leadingIcon,
    this.prefixIcon,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.white,
    this.textFontSize,
    this.isOutlined = false,
    this.gradient, // Optional custom gradient (used only if isOutlined = false)
  });

  final String? title;
  final Color? backgroundColor, textColor, outlinedColor;
  final bool isOutlined;
  final double? width, height, textFontSize;
  final VoidCallback? onPressed;
  final Widget? leadingIcon, prefixIcon;
  final Gradient? gradient; // Custom gradient (ignored if isOutlined = true)

  @override
  Widget build(BuildContext context) {
    // Default gradient (left-to-right) if not outlined
    final defaultGradient = LinearGradient(
      colors: [
        AppColors.primaryGrad,
        context.primary,
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: isOutlined ? 0 : 2,
        backgroundColor: isOutlined ? backgroundColor : Colors.transparent, // Transparent if gradient
        shadowColor: context.onSecondary.withOpacity(0.15),
        disabledBackgroundColor: context.primary.withOpacity(0.20),
        minimumSize: Size(width ?? context.width, (height ?? 56).sp),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.sp),
          side: isOutlined
              ? BorderSide(
            color: outlinedColor ?? context.onSecondary.withOpacity(0.5),
          )
              : BorderSide.none,
        ),
        padding: EdgeInsets.zero, // Remove default padding for gradient
      ),
      child: isOutlined
          ? _buildContent() // Simple solid color (no gradient)
          : Ink( // Gradient background
        decoration: BoxDecoration(
          gradient: gradient ?? defaultGradient,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: _buildContent(),
      ),
    );
  }

  // Reusable content (text + icons)
  Widget _buildContent() {
    return Container(
      width: width ?? double.infinity,
      height: (height ?? 56).sp,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixIcon != null ? 10.horizontalSpace : SizedBox(),
          prefixIcon ?? SizedBox(),
          TextWidget(
            title ?? '',
            color: isOutlined ? textColor : AppColors.whiteColor,
            fontSize: textFontSize,
          ),
          leadingIcon != null ? 10.horizontalSpace : SizedBox(),
          leadingIcon ?? SizedBox(),
        ],
      ),
    );
  }
}
// class CustomButton extends StatelessWidget {
//   const CustomButton(
//       {super.key,
//       this.title,
//       this.width,
//       this.height,
//       this.onPressed,
//       this.outlinedColor,
//       this.leadingIcon,
//       this.prefixIcon,
//       this.backgroundColor = Colors.transparent,
//       this.textColor = Colors.white,
//       this.textFontSize,
//       this.isOutlined = false});
//
//   final String? title;
//   final Color? backgroundColor, textColor, outlinedColor;
//   final bool isOutlined;
//   final double? width, height, textFontSize;
//   final VoidCallback? onPressed;
//   final Widget? leadingIcon,prefixIcon;
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         elevation: isOutlined ? 0 : 2,
//         backgroundColor: isOutlined ? backgroundColor : context.primary,
//         shadowColor: context.onSecondary.withOpacity(0.15),
//         disabledBackgroundColor: context.primary.withOpacity(0.20),
//         minimumSize: Size(width ?? context.width, (height ?? 56).sp),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.sp),
//           side: isOutlined
//               ? BorderSide(
//                   color: outlinedColor ?? context.onSecondary.withOpacity(0.5),
//                 )
//               : BorderSide.none,
//         ),
//       ),
//       child: Row(mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           prefixIcon!=null?10.horizontalSpace:SizedBox(),
//           prefixIcon??SizedBox(),
//           TextWidget(
//             title,
//             color: isOutlined ? textColor : AppColors.whiteColor,//context.secondary,
//             fontSize: textFontSize,
//           ),
//           leadingIcon!=null?10.horizontalSpace:SizedBox(),
//           leadingIcon??SizedBox()
//         ],
//       ),
//     );
//   }
// }

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      this.onTap,
      this.icon,
      this.borderColor,
      this.padding = 12,
      this.showBorder = false,
      this.isFilled = false});

  final VoidCallback? onTap;
  final SvgPicture? icon;
  final bool showBorder, isFilled;
  final double padding;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(70.sp),
      child: Container(
        padding: EdgeInsets.all(padding).r,
        decoration: BoxDecoration(
          color:
              isFilled ? context.scaffoldBackgroundColor : Colors.transparent,
          shape: BoxShape.circle,
          border: showBorder
              ? Border.all(
                  color: borderColor ?? context.onSecondary.withOpacity(0.5),
                )
              : null,
        ),
        child: icon,
      ),
    );
  }
}
