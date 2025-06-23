
import 'package:flutter_rating/flutter_rating.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/exports.dart';


class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.rateYourExperience,
        isTransparent: true,
      ),
      // appBar: AppBar(title: Text('Rate Your Experience')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 108.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.cardColor
              ),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 64.h,
                        width: 64.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red
                        ),
                      ),
                      20.horizontalSpace,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWidget('Dr. Sarah Johnson',fontSize: 18,color: AppColors.primaryTextColor,),

                          const TextWidget('Cardiologist',fontSize: 16,color: AppColors.secFontColor,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Assets.icons.watchIcon.svg(),
                              5.horizontalSpace,
                              const TextWidget('February 23, 2024 • 10:30 AM',fontSize: 16,color: AppColors.secFontColor,),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // minLeadingWidth: 1,
                // minVerticalPadding: 1,

              ),
            ),
            20.verticalSpace,
            Align(
                alignment: Alignment.topLeft,
                child: TextWidget(AppStrings.howWasYourExperience, fontSize: 18)),
            20.verticalSpace,
            StarRating(
              rating: 4,
              allowHalfRating: true,
              onRatingChanged: (rating){
                // setState(() => this.rating = rating);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => Icon(Icons.star_border, size: 32)),
            ),
            TextWidget(AppStrings.tapToRate,fontSize: 16,fontWeight: FontWeight.w400,),
            CustomTextField(
              maxLines: 4,
              hintText: '${AppStrings.shareYourExperience} Dr. Johnson (optional)',
              borderColor: AppColors.cardColor,
              filledColor: AppColors.cardColor,
              borderRadius: 12,
            ),
            const SizedBox(height: 10),
            CustomButton(
                onPressed: (){},
                title:  AppStrings.submitReview
            )
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: Text('Submit Review'),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}