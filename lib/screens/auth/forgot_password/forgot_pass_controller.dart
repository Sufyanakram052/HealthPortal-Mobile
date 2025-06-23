import 'package:htca_app/constants/exports.dart';
import 'package:htca_app/constants/keys.dart';
import 'package:htca_app/helper/storage_helper.dart';

import '../login/login_screen.dart';


class ForgotPassController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController insuranceController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;
  bool staySigned = false;
  bool hasSavedPin = false;

  void toggleHidePassword() {
    hidePassword = !hidePassword;
    update();
  }

  void changeStaySignedIn(bool? value) {
    if (value != null) {
      staySigned = value;
      update();
    }
  }

  void onLogin() async {
    if (formKey.currentState?.validate() == true) {
      CustomTextField.unFocus();

      String email = emailController.text.trim().toLowerCase();
      String? password = passwordController.text.trim();
      //String? fcmToken = await NotificationService.getFCMToken();
      appPrint('PASSWORD: $password');

      var resp = await APIService.instance.callApi(
        AppUrls.login,
        APIMethods.post,
        showLoader: true,
        //headers: {'fcmToken': fcmToken},
        data: {'email': email, 'password': password},
      );

      if (resp != null) {
        // Save User
        AppGlobals.setUserData(resp);

        _clearFields();

        //Get.off(() => const HomePage());

        // String? pin = await _checkSavedPin();
        // if (pin == null) {
        _setupPinCode();
        // } else {
        // //  Get.off(() => const HomePage());
        // }
      }
    }
  }

  void _clearFields() {
    emailController.clear();
    passwordController.clear();
  }

  Future<String?> _checkSavedPin() async {
    String? savedPin = await StorageHelper.getVariable(AppKeys.pinCode);
    appPrint('SAVED PIN: $savedPin');
    hasSavedPin = savedPin != null;
    return savedPin;
  }

  void onPinCodeTap() async {
    String? hasPin = await _checkSavedPin();
    if (hasPin != null) {
      //Get.to(() => const PinCodeLogin());
    } else {
      // Setup Pin first Via login
      CustomToast.show(message: AppStrings.setupPinFirstAfterLogin);
    }
  }

  void _setupPinCode() {
    // Get.to(() => const SetupPinCode());
  }

  void onForgotPassClick() {
    // Get.to(() => const ForgotPassword());
  }

  void onPrivacyClick() {
    Helper.urlLauncher(AppUrls.privacyPolicy);
  }
  void onSignUp(){
    //Get.to(() => const SignUpScreen());
  }
  void toLogIn(){
    Get.offAll(() => const Login());
  }

}
