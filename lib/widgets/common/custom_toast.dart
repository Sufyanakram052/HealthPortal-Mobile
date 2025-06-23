import 'package:fluttertoast/fluttertoast.dart';
import 'package:htca_app/constants/exports.dart';

class CustomToast {
  static void show(
      {String? message, bool success = false, bool top = false}) async {
    await Fluttertoast.cancel();

    Fluttertoast.showToast(
      msg: (message ??
              (success ? AppStrings.success : AppStrings.somethingWentWrong))
          .tr,
      fontSize: 14.sp,
      textColor: Colors.white,
      gravity: top ? ToastGravity.TOP : ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 5,
      backgroundColor: success ? AppColors.lightGreen : AppColors.redColor,
    );
  }
}
