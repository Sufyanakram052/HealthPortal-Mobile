import 'package:htca_app/constants/exports.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({super.key, this.size = 5, this.color = AppColors.primary});
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final double dotSize = size.sp;
    return Container(
      height: dotSize,
      width: dotSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
