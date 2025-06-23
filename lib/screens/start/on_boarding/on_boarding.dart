import 'package:htca_app/constants/exports.dart';
import 'package:htca_app/screens/start/splash/splash_controller.dart';
import 'package:htca_app/widgets/components/app_logo.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnBoardController>(
        init: OnBoardController(),
        builder: (context) {
          return Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              80.verticalSpace,
              AppLogo(
                size: 0.25.sh,
              ),
              const TextWidget(
                AppStrings.healthTech,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryTextColor,
              ),
              const TextWidget(
                AppStrings.yourHealthJourneyBeginsHere,
                fontSize: 16,
                color: AppColors.secFontColor,
              ),
              30.verticalSpace,
              _buildRoleCard(title: AppStrings.smartHealthMonitoring,description: AppStrings.realTimeHealthTracking,onTap: (){}, icon: Assets.icons.healthCare.svg(height: 58,width: 58),boxColor: AppColors.cardColor),
              _buildRoleCard(title: AppStrings.doctorAccess,description: AppStrings.connectWithHealthcareProfessionals,onTap: (){}, icon: Assets.icons.healthCare.svg(height: 58,width: 58)),
              _buildRoleCard(title: AppStrings.secureHealthRecords,description: AppStrings.yourDataIsProtected,onTap: (){}, icon: Assets.icons.healthCare.svg(height: 58,width: 58),boxColor: AppColors.cardColor),
              20.verticalSpace,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  leadingIcon: Assets.icons.arrowForward.svg(color: AppColors.whiteColor,height: 20,width: 20),
                  onPressed: (){},//controller.onLogin,
                  title: AppStrings.getStartedAsPatient,
                  textColor: AppColors.whiteColor,
                ),
              ),
              20.verticalSpace,
              TextWidget(AppStrings.areYouAHealthcareProvider),
              30.verticalSpace,
              TextWidget(AppStrings.loginAsDoctor,
              fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              // 5.horizontalSpace,

            ],
          );
        },
      ),
    );
  }

  Widget _buildRoleCard({
    required String title,
    required String description,
    required Widget icon,
    Color? boxColor,
    VoidCallback? onTap
  }){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
      child: Container(
        height: 80.sp,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            // color: AppColors.redColor,
            border: Border.all(color: boxColor??AppColors.divColor),
            color: boxColor,//AppColors.cardColor,
            borderRadius: BorderRadius.circular(12.r)
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: icon,
              ),
            ),
            10.horizontalSpace,
            Flexible(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(title,fontSize: 16,color: AppColors.primaryTextColor,),
                    TextWidget(description,fontSize: 14,),
                  ],
                ),
              ),
            ),
            10.horizontalSpace,
            // Expanded(
            //   child: InkWell(
            //       onTap: onTap,
            //       child: Assets.icons.arrowForward.svg(height: 24,width: 24)),
            // ),
          ],
        ),
      ),
    );
  }

}
