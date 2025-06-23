import 'package:htca_app/constants/exports.dart';
import 'package:htca_app/screens/auth/login/login_controller.dart';
import 'package:htca_app/widgets/components/app_logo.dart';



class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: 0.95.sh,
            padding: const EdgeInsets.all(20).r,
            child: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (controller) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 0.02.sh),
                      // 50.verticalSpace,
                      AppLogo(
                        size: 0.18.sh,
                      ),
                      // AppLogo(size: 100.sp, nrSize: 50.sp),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.03.sh),
                        // padding: EdgeInsets.symmetric(vertical: 0.03.sh),
                        child: const TextWidget(
                          AppStrings.welcomeBack,
                          fontSize: 32,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: TextWidget(
                          AppStrings.signInToAccessYourMedicalRecords,
                          fontSize: 20,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                      10.verticalSpace,
                      CustomTextField(

                        title: AppStrings.emailOrUsername,
                        hintText: AppStrings.enterYourEmailOrUserName,
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        validator: Validaters.validateEmail,
                        borderColor: AppColors.divColor,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Assets.icons.email.svg(),
                        ),
                      ),
                      CustomTextField(
                        borderColor: AppColors.divColor,
                        isPasswordField: true,
                        title: AppStrings.password,
                        hintText: AppStrings.enterYourPassword,
                        isObscure: controller.hidePassword,
                        controller: controller.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        textCapitalization: TextCapitalization.none,
                        onSuffixTap: controller.toggleHidePassword,
                        validator: (text) => Validaters.validatePassword(text,
                            errorText: AppStrings.pleaseEnterValidPassword),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Assets.icons.passLock.svg(),
                        ),
                      ),

                      20.verticalSpace,
                      CustomButton(
                        onPressed: controller.onLogin,
                        title: AppStrings.signIn,
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            AppStrings.forgotPasswordQ,
                            onTap: controller.onForgotPassClick,
                            fontSize: 22,
                            color: AppColors.primaryTextColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 0.02.sh),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Divider(
                              thickness: 1,
                              endIndent: 12,
                              color: AppColors.divColor,
                            ),
                          ),
                          TextWidget(
                            AppStrings.orContinueWith,
                            fontSize: 14,
                            onTap: controller.onPrivacyClick,
                            color: AppColors.primaryTextColor,
                          ),
                          const Expanded(
                            child: Divider(
                              thickness: 1,
                              indent: 12,
                              color: AppColors.divColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.018.sh),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: SocialAuthCard(
                              title: AppStrings.google,
                              icon: Assets.icons.google.svg(height: 20.sp,width: 20.sp),
                              onTap: (){},
                            ),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: SocialAuthCard(
                              title: AppStrings.apple,
                              width: 130.sp,
                              icon: Assets.icons.apple.svg(height: 20.sp,width: 20.sp),
                              onTap: (){},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.02.sh),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextWidget(
                            AppStrings.donNotHaveAnAccount,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          5.horizontalSpace,
                          TextWidget(AppStrings.signUp, onTap: controller.onToSignUp,),

                        ],
                      ),
                      SizedBox(height: 0.02.sh),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.icons.lock.svg(height: 16.sp,width: 16.sp),
                           6.horizontalSpace,
                           const TextWidget(
                            AppStrings.yourInformationIsSecurelyEncrypted,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
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



}
