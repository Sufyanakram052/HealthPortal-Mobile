import 'package:htca_app/constants/exports.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge(
      {super.key,
      this.value,
      this.forNotification = false,
      this.size = 22,
      this.fontSize = 14,
      this.showDot = false});
  final int? value;
  final bool showDot;
  final bool forNotification;
  final double size, fontSize;

  @override
  Widget build(BuildContext context) {
    if ((value != null && (value ?? 0) > 0) || showDot) {
      return Container(
        padding: forNotification
            ? EdgeInsets.all(
                fontSize * 0.4,
              ).r
            : EdgeInsets.symmetric(
                horizontal: fontSize * 0.4,
                vertical: fontSize * 0.1,
              ).r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.primary,
        ),
        child: Center(
          child: TextWidget(
            '${(value ?? 0) > 99 ? '99+' : value ?? ''}',
            fontSize: fontSize,
            color: context.onPrimary,
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
