import 'package:htca_app/constants/exports.dart';




class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isTransparent: true,
        title: AppStrings.createAccount,
        showBackIcon: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: 0.95.sh,
            padding: const EdgeInsets.all(20).r,
            child: GetBuilder<SignupController>(
              init: SignupController(),
              builder: (controller) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // SizedBox(height: 0.02.sh),
                      // 50.verticalSpace,
                      // AppLogo(size: 100.sp, nrSize: 50.sp),
                      // const TextWidget(
                      //   AppStrings.createAccount,
                      //   fontSize: 24,
                      //   color: AppColors.primaryTextColor,
                      // ),
                      const TextWidget(
                        AppStrings.pleaseFillInYourInformation,
                        fontSize: 16,
                        color: AppColors.secFontColor,
                      ),
                      10.verticalSpace,
                      CustomTextField(
                        borderColor: AppColors.divColor,
                        title: AppStrings.firstName,
                        hintText: AppStrings.enterYourFirstName,
                        controller: controller.firstNameController,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.none,
                        validator: Validaters.validateName,
                      ),
                      CustomTextField(
                        borderColor: AppColors.divColor,
                        title: AppStrings.lastName,
                        hintText: AppStrings.enterYourLastName,
                        controller: controller.lastNameController,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.none,
                        // onSuffixTap: controller.toggleHidePassword,
                        validator: Validaters.validateName,
                      ),
                      CustomTextField(
                        borderColor: AppColors.divColor,
                        title: AppStrings.emailAddress,
                        hintText: AppStrings.exampleEmail,
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        // onSuffixTap: controller.toggleHidePassword,
                        validator: Validaters.validateEmail,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Assets.icons.email.svg(),
                        ),
                      ),
                      CustomTextField(
                        borderColor: AppColors.divColor,
                        title: AppStrings.insuranceNumber,
                        hintText: AppStrings.enterYourInsuranceNumber,
                        controller: controller.insuranceController,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.none,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Assets.icons.insuranceCard.svg(),
                        ),
                        // validator: (text) => Validaters.validatePassword(text,
                        //     errorText: AppStrings.pleaseEnterValidPassword),
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
                      ),
                      // TextWidget(AppStrings.mustBeAtLeastCharacters,fontSize: 12,),
                      _onValidPassword(),
                      20.verticalSpace,
                      CustomButton(
                        onPressed: controller.onSignUp,
                        title: AppStrings.createAccount,
                      ),
                      20.verticalSpace,
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
                            AppStrings.orSignWpWith,
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
                            AppStrings.alreadyHaveAnAccount,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          8.horizontalSpace,
                          TextWidget(AppStrings.signIn, onTap: controller.toLogIn,),
                        ],
                      ),
                      SizedBox(height: 0.02.sh),
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

  Widget onHintPassword({required String title}){
    return Row(
      children: [
        SizedBox(
            height: 20,
            child: Assets.icons.tickCircle.svg(height: 15,width: 10)),
        8.horizontalSpace,
        TextWidget(
          title,
          fontSize: 14,)
      ],
    );
  }

  Widget _onValidPassword(){
    return Column(
      children: [
        onHintPassword(title: AppStrings.atLeastCharacters),
        7.verticalSpace,
        onHintPassword(title: AppStrings.oneUppercaseLetter),
        7.verticalSpace,
        onHintPassword(title: AppStrings.oneNumber),
        7.verticalSpace,
        onHintPassword(title: AppStrings.oneSpecialCharacter),
      ],
    );
  }


}
