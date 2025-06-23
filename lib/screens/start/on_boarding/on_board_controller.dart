import 'package:flutter/services.dart';
import 'package:htca_app/constants/exports.dart';
import 'package:htca_app/screens/auth/login/login_screen.dart';

import '../../../constants/keys.dart';
import '../../../helper/storage_helper.dart';

class OnBoardController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _initControllers();
    _getData();
  }

  void _initControllers() {
    // NotificationService.registerNotification();
    // OfflineHandler.instance.startConnectionChecker();
  }

  void _getData() async {
    // if (AppUrls.baseUrlDev.contains("192")) {
    //   CustomToast.show(message: AppStrings.localServerConnected);
    // }

    SystemChrome.setSystemUIOverlayStyle(
      Get.isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
    );

    // User? user = await AppGlobals.getUser();

    bool? isDevMode = await StorageHelper.getVariable(
      AppKeys.devMode,
    );
    // String? accessToken = user?.accessToken;

    APIService.instance.updateBaseUrl(
      // AppUrls.baseUrlProd,
      // AppUrls.baseUrlDev,
      isDevMode ?? true ? AppUrls.baseUrlDev : AppUrls.baseUrlProd,
      // token: accessToken
    );

    bool connected = await Helper.isConnected();

    // if (connected == true) {
    // // if (connected == true && accessToken != null) {
    //   var resp = await APIService.instance
    //       .callApi(AppUrls.userProfile, APIMethods.get);
    //   if (resp != null) {
    //     // Save User
    //     AppGlobals.setUserData(resp);
    //   }
    // } else {
    //   await Future.delayed(const Duration(seconds: 1));
    // }
    //
    // if(user!=null)
    //
    // bool updateAvailable = await _updateAvailable();

    // if (!updateAvailable) {
    //Get.off(() => const Login());
    // }
  }

// Future<bool> _updateAvailable() async {
// final upGrader = Upgrader(
//   debugLogging: true,
// );

// Initialize the upgrade information
// await upGrader.initialize();

// if (upGrader.isUpdateAvailable()) {
//   return true;
// } else {
//   return false;
// }
// }
}
