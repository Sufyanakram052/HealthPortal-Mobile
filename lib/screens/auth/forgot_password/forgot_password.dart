import 'package:htca_app/constants/exports.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isTransparent: true,
        title: AppStrings.forgotPassword,
        showBackIcon: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: 0.95.sh,
            padding: const EdgeInsets.all(20).r,
            child: GetBuilder<ForgotPassController>(
              init: ForgotPassController(),
              builder: (controller) {
                return Form(
                  //key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        AppStrings.resetYourPassword,
                        fontSize: 24,
                        color: AppColors.primaryTextColor,
                      ),
                      10.verticalSpace,
                      const TextWidget(
                        AppStrings.enterYourEmailAddressAndEeSendYouInstructionsToResetYourPassword,
                        fontSize: 16,
                        color: AppColors.secFontColor,
                      ),
                      15.verticalSpace,
                      CustomTextField(
                        borderColor: AppColors.divColor,
                        title: AppStrings.emailAddress,
                        hintText: AppStrings.enterYourEmailAddress,
                        hintStyle: TextStyle(color: AppColors.primaryTextColor),
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        // onSuffixTap: controller.toggleHidePassword,
                        validator: Validaters.validateEmail,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Assets.icons.emailBold.svg(height: 10,width: 10),
                        ),
                      ),
                      13.verticalSpace,
                      onNoteCard(),



                      20.verticalSpace,
                      CustomButton(
                        onPressed: controller.onSignUp,
                        title: AppStrings.sendResetLink,
                      ),
                      20.verticalSpace,

                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextWidget(
                            AppStrings.rememberYourPassword,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          8.horizontalSpace,
                          TextWidget(AppStrings.signIn, onTap: controller.toLogIn,),
                        ],
                      ),
                      SizedBox(height: 0.3.sh),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextWidget(
                            AppStrings.needHelp,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          8.horizontalSpace,
                          TextWidget(AppStrings.contactSupport, onTap: (){},
                          color: AppColors.primary,
                          ),
                        ],
                      ),

                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget onNoteCard(){
    return Container(
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 72,
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Assets.icons.iIcon.svg(height: 15,width: 10),
                )),
            10.horizontalSpace,
            Flexible(
              flex: 3,
              child: TextWidget(AppStrings.makeSureToCheckYourSpamFolder,
              fontSize: 14,),
            )
          ],
        ));
  }



}
