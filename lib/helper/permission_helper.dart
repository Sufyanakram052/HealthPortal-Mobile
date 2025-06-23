import 'package:htca_app/constants/exports.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<bool> checkPermission({Permission? permission}) async {
    permission ??= Permission.camera;
    PermissionStatus permissionStatus = await permission.status;
    appPrint("checkPermission: $permissionStatus");
    bool status = false;
    if (permissionStatus.isGranted) {
      status = true;
    } else {
      status = await _requestPermission(permission);
    }
    return status;
    // cameraPermissionStatus = status;
    // update(); // This notifies the UI to update (if you're using GetBuilder or similar).
  }

  static Future<bool> _requestPermission(Permission? permission) async {
    if (permission != null) {
      PermissionStatus status = await permission.status;
      if (status == PermissionStatus.granted) {
        return true;
      }

      // if (!status.isGranted) {
      if (status == PermissionStatus.denied) {
        status = await permission.request();
      } else if (status.isGranted) {
        // Permission is granted
        return true;
      } else if (status.isDenied) {
        // Permission is denied
      } else if (status.isPermanentlyDenied) {
        // Permission is permanently denied
        await showSettingsDialog();
      }
    } else {}
    return false;
  }

  static Future showSettingsDialog() async {
    await CustomDialogs.showAlert(
      notButtonText: AppStrings.cancel,
      yesButtonText: AppStrings.open,
      title: AppStrings.permissionDenied,
      description: AppStrings.pleaseGrantCameraPermission,
      onYesTap: () => openAppSettings(),
    );
  }
}
