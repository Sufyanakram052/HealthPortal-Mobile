import 'package:flutter/cupertino.dart';
import 'package:htca_app/constants/exports.dart';

class SocialAuthCard extends StatelessWidget {
  final String? title;
  final double? height;
  final double? width;
  final Widget icon;
  final VoidCallback? onTap;
  const SocialAuthCard({super.key, this.title, this.height= 48.0, this.width,  required this.icon,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            12.horizontalSpace,
            TextWidget(title,color: AppColors.primaryTextColor,)
          ],
        ),
      ),
    );
  }
}
