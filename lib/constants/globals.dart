// import 'package:htca_app/backend/models/printer/printer_model.dart';
import 'package:htca_app/constants/exports.dart';

class AppGlobals {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String appName = "NR QuickScan";

  static const String packageName = "com.origami.nationalramp";

  static const String playStoreLink = "http://";
  static const String appStoreLink = "http://";

  static String? fcmToken;
  // static User _user = User();
  // static PrinterModel _printerModel = PrinterModel();

  // static User get user => _user;

  static bool showError = true;

  static const int pinCodeLength = 4;

  static double scanWindowMaxHeight = 0.27.sh;
  static double dragButtonDefaultPaddingTop = 0.010.sh;
  static double dragButtonDefaultPaddingRight = 0.19.sw;
  static double scanWindowDefaultHeight = 0.19.sh;
  static double scanWindowDefaultWidth = 0.6.sw;

  static void setUserData(Map<String, dynamic> data) {
    // try {
    //   appPrint("To Save user: $data");
    //   User newUser = User.fromJson(data);
    //   _user = newUser;
    //
    //   _saveUser(_user);
    //   APIService.instance.setToken(_user.accessToken);
    // } catch (e) {
    //   appPrint('SetUserData error: $e');
    // }
  }

  // static void _saveUser(User? user) {
  // if (user != null) {
  //   StorageHelper.saveModel(AppKeys.user, user);
  // }
  // }

  // static Future<User?> getUser() async {
  //   var data = await StorageHelper.getModel(AppKeys.user);
  //   appPrint("was Saved user: $data");
  //
  //   if (data != null) {
  //     User newUser = User.fromJson(data);
  //     _user = newUser;
  //     return _user;
  //   } else {
  //     return data;
  //   }
  // }

  // static void saveNotificationSetting(NotificationSetting? setting) {
  //   if (setting != null) {
  //     _user.notificationSetting = setting;
  //     _saveUser(_user);
  //   }
  // }

  static final Map<String, String> caseStatusMapFunction = {
    "Created": CaseStatusKeys.created,
    "RFQ_Sent": CaseStatusKeys.evalAssigned,
    "EvalScheduled": CaseStatusKeys.evalScheduled,
    "EvalReceived": CaseStatusKeys.evalSubmitted,
    "EvalReview": CaseStatusKeys.evalSubmitted,
    "EvalSent": CaseStatusKeys.evalSubmitted,
    "PO_Received": CaseStatusKeys.evalSubmitted,
    "Install_PO_Sent": CaseStatusKeys.installationAssigned,
    "InstallScheduled": CaseStatusKeys.installationScheduled,
    "InstallReceived": CaseStatusKeys.installationSubmitted,
    "InstallSent": CaseStatusKeys.installSent,
    "PaymentReceived": CaseStatusKeys.paymentReceived,
    "InspectionAssigned": CaseStatusKeys.inspectionAssigned,
    "InspectionScheduled": CaseStatusKeys.inspectionScheduled,
    "InspectionReceived": CaseStatusKeys.inspectionSubmitted,
    "InspectionCompleted": CaseStatusKeys.inspectionCompleted,
    "RepairCreated": CaseStatusKeys.repairCreated,
    "RepairAssigned": CaseStatusKeys.repairAssigned,
    "RepairScheduled": CaseStatusKeys.repairScheduled,
    "RepairReceived": CaseStatusKeys.repairSubmitted,
    "DeInstallationStart": CaseStatusKeys.deInstallationStart,
    "DeInstallationScheduled": CaseStatusKeys.deInstallationScheduled,
    "DeInstall_PO_Sent": CaseStatusKeys.deInstallPOSent,
    "DeInstallationReceived": CaseStatusKeys.deInstallationSubmitted,
  };
}

class CaseStatusKeys {
  static const String created = 'Created';
  static const String evalAssigned = 'Eval Assigned';
  static const String evalScheduled = 'Eval Scheduled';
  static const String evalSubmitted = "Eval Submitted";
  static const String installationAssigned = "Installation Assigned";
  static const String installationScheduled = 'Installation Scheduled';
  static const String installationSubmitted = "Installation Submitted";
  static const String installSent = "Install Sent";
  static const String paymentReceived = "Payment Received";
  static const String inspectionAssigned = 'Inspection Assigned';
  static const String inspectionScheduled = "Inspection Scheduled";
  static const String inspectionSubmitted = "Inspection Submitted";
  static const String inspectionCompleted = "Inspection Completed";
  static const String repairCreated = 'Repair Created';
  static const String repairAssigned = 'Repair Assigned';
  static const String repairScheduled = "Repair Scheduled";
  static const String repairSubmitted = "Repair Submitted";
  static const String deInstallationStart = "DeInstallationStart";
  static const String deInstallationScheduled = "DeInstallation Scheduled";
  static const String deInstallPOSent = "DeInstall PO Sent";
  static const String deInstallationSubmitted = "DeInstallation Submitted";
  static const String deInstallationReceived = "DeInstallationReceived";
}
