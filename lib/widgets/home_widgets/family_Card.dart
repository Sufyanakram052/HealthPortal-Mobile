import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:htca_app/constants/exports.dart';

import '../../constants/colors.dart';

class FamilyCardWidget extends StatelessWidget {
  const FamilyCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126,
      width: 126,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divColor),
        // color: Colors.red
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0,left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.divColor),
                // color: Colors.red
              ),
            ),
            7.verticalSpace,
            TextWidget('Sarah',),
            3.verticalSpace,
            TextWidget('Wife',fontSize: 14,),

          ],
        ),
      ),
    );
  }
}
