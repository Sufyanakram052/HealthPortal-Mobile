import 'package:htca_app/constants/exports.dart';
import 'package:htca_app/screens/start/splash/splash_controller.dart';
import 'package:htca_app/widgets/components/app_logo.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (context) {
          return Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              80.verticalSpace,
              AppLogo(
                size: 0.25.sh,
              ),
              const TextWidget(
                AppStrings.welcomeToHealthTech,
                fontSize: 24,
                color: AppColors.primaryTextColor,
              ),
              const TextWidget(
                AppStrings.pleaseSelectYourRoleToContinue,
                fontSize: 16,
                color: AppColors.secFontColor,
              ),
              30.verticalSpace,
              _buildRoleCard(title: AppStrings.imAHealthcareProvider,description: AppStrings.joinOurNetworkOfMedicalProfessionals,onTap: (){}, icon: Assets.icons.healthCare.svg(height: 58,width: 58)),
              _buildRoleCard(title: AppStrings.imAPatient,description: AppStrings.findAndConnectWithHealthcareProviders,onTap: (){}, icon: Assets.icons.healthCare.svg(height: 58,width: 58)),
              70.verticalSpace,
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(AppStrings.alreadyRegistered),
                  5.horizontalSpace,
                  TextWidget(AppStrings.signIn,
                  onTap: (){},
                  ),
                ],
              ),
              30.verticalSpace,
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(AppStrings.stringByContinuingYouAgreeToOur),
                  // 5.horizontalSpace,
                  TextWidget(AppStrings.termsOfService,
                  onTap: (){},
                  ),
                  5.horizontalSpace,
                  TextWidget(AppStrings.and,
                    fontSize: 14,
                  ),

                ],
              ),
              TextWidget(AppStrings.privacyPolicy,
              ),


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
    VoidCallback? onTap
}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
      child: Container(
        height: 120.sp,
        decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(12.r)
      ),
        child: Row(
          children: [
            Expanded(child: icon),
            10.horizontalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(title,fontSize: 18,color: AppColors.primaryTextColor,),
                  TextWidget(description,fontSize: 14,),
                ],
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: InkWell(
                  onTap: onTap,
                  child: Assets.icons.arrowForward.svg(height: 24,width: 24)),
            ),
          ],
        ),
      ),
    );
  }

}
