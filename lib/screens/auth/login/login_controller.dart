import 'package:get/get.dart';
import 'package:htca_app/constants/exports.dart';
import 'package:htca_app/constants/keys.dart';
import 'package:htca_app/helper/storage_helper.dart';

import '../../home/main_page/bottom_nav_bar.dart';
import '../forgot_password/forgot_password.dart';


class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
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
    Get.off(() => BottomNavBar());

    // if (formKey.currentState?.validate() == true) {
    //   CustomTextField.unFocus();


      // String email = emailController.text.trim().toLowerCase();
      // String? password = passwordController.text.trim();
      // //String? fcmToken = await NotificationService.getFCMToken();
      // appPrint('PASSWORD: $password');
      //
      // var resp = await APIService.instance.callApi(
      //   AppUrls.login,
      //   APIMethods.post,
      //   showLoader: true,
      //   //headers: {'fcmToken': fcmToken},
      //   data: {'email': email, 'password': password},
      // );
      //
      // if (resp != null) {
      //   // Save User
      //   AppGlobals.setUserData(resp);
      //
      //   _clearFields();
      //
      //   //Get.off(() => const HomePage());
      //
      //   // String? pin = await _checkSavedPin();
      //   // if (pin == null) {
      //   _setupPinCode();
      //   // } else {
      //   // //  Get.off(() => const HomePage());
      //   // }
      // }
    // }
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
    Get.to(() => const ForgotPasswordScreen());
  }

  void onPrivacyClick() {
    Helper.urlLauncher(AppUrls.privacyPolicy);
  }
  void onToSignUp(){
    Get.to(() => const SignUpScreen());
  }

  // In your controller
  void openCDrawer() {
    Scaffold.of(Get.context!).openDrawer();
    //Get.find<ScaffoldState>(tag: 'mainScaffold').openDrawer();
    // scaffoldKey.currentState?.openDrawer();
    // Get.find<ScaffoldState>(tag: 'mainScaffold').openDrawer();
  }

}
