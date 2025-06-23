class AppUrls {
  static const String baseUrlProd =
      "https://api.nrquikscan.com"; //Production server base
  static const String supportLinkProd =
      "https://support.nrquikscan.com/?access_token="; //Production server base
// static String sslCertificate = Assets.sslCertificates.prodCertificate;

  /// dev CaseManagement
  //Muneeb IP
  // static const String baseUrlDev = "http://192.168.7.237:4000/";
  // Hassaan IP
  // static const String baseUrlDev = "http://192.168.7.177:4000/";
  static const String baseUrlDev = "https://www.dev.nrquikscan.com/";
  static const String supportLinkDev =
      "https://support.nrquikscan.dev/?access_token=";
  // static String sslCertificate = Assets.sslCertificates.devCertificate;

  static const String configuratorBaseUrl =
      "https://api.configurator.dev.nrquikscan.com";

  /// Staging CaseManagement
  // static const String baseUrlDev ="https://api.stage.nrquikscan.com";//"https://api.stage.cm.nrquikscan.com/";
  // static const String supportLinkDev =
  //     "https://stage.support.nrquikscan.com/?access_token=";
  // static const String configuratorBaseUrl =
  //     "https://api.configurator.stage.nrquikscan.com";

  /// Pre-Prod
  // static const String baseUrlDev = "https://api.preprod.nrquikscan.com/";
  // static const String supportLinkDev =
  //     "https://stage.support.nrquikscan.com/?access_token=";
  // static const String configuratorBaseUrl =
  //     "https://api.configurator.preprod.nrquikscan.com";

  // Auth
  static const String auth = "/auth";
  static const String login = "$auth/login";
  static const String forgotPassword = "$auth/generate-verification-token";
  static const String verifyOTPCode = "$auth/email-verification";
  static const String resetPassword = "$auth/forgot-password";
  static const String changePassword = "$auth/change-password";
  static const String logout = "$auth/logout";

  // User
  static const String user = "/user";
  static const String userProfile = "$user/profile";
  static const String userUpdate = "$user/update";
  static const String userDashboard = "$user/dashboard";

  // Notifications
  static const String notification = '/notification';
  static const String notificationSetting = '$notification/setting';
  static const String notificationList = '$notification/list';
  static const String notificationsReadOrDelete = '$notification/read';
  static const String notificationsReadAll = '$notification/read-all';

  // Purchase Order
  static const String purchaseOrder = '/purchase-order';
  static const String purchaseOrderList = '$purchaseOrder/list';
  static const String purchaseOrderListMerged = '$purchaseOrder/list/merged';
  static const String purchaseOrderStatus = '$purchaseOrder/status';
  static const String purchaseOrderItems = '$purchaseOrder/items';
  static const String purchaseBulkOrders = '$purchaseOrder/bulk-orders';
  static const String purchaseById = '$purchaseOrder/byId';

  // Purchase Order Multiuser
  static const String purchaseUserList = '$purchaseOrder/users/list';
  static const String purchaseAssignSub =
      '$purchaseOrder/assign/sub'; // /assign/sub Get to fetch list of assignedTask, Post to assign new task, delete to unAssign task
  static const String purchaseSubList = '$purchaseOrder/sub/list';
  static const String purchaseSubItems = '$purchaseOrder/sub/items';
  static const String rentalInstallationSubmit = '$installation/items-rental';
  static const String purchaseSubStatus = '$purchaseOrder/sub/status';
  static const String purchaseSubReminder = '$purchaseOrder/sub/reminder';

  // Inventory
  static const String inventory = '/inventory';
  static const String inventoryList = '$inventory/list';
  static const String inventoryListMerged = '$inventory/list/merged';
  static const String inventoryStatus = '$inventory/status';
  static const String inventoryItems = '$inventory/items';
  static const String inventoryBulkItems = '$inventory/bulk-items';
  static const String inventoryById = '$inventory/byId';

  // Inventory Multiuser
  static const String inventoryUserList = '$inventory/users/list';
  static const String inventoryAssignSub = '$inventory/assign/sub';
  static const String inventorySubList = '$inventory/sub/list';
  static const String inventorySubItems = '$inventory/sub/items';
  static const String inventorySubStatus = '$inventory/sub/status';
  static const String inventorySubReminder = '$inventory/sub/reminder';

  // Installation
  static const String installation = '/installation';
  static const String installationList = '$installation/list';
  static const String installationListMerged = '$installation/list/merged';
  static const String installationStatus = '$installation/status';
  static const String installationItems = '$installation/items';
  static const String installationBulkInstallation =
      '$installation/bulk-installation';
  static const String installationById = '$installation/byId';
  static const String installationByIdApp = '$installation/byId-app';

  // de-installation
  static const String deInstallation = '/de-installation';
  static const String deInstallationById = '$deInstallation/byId';
  static const String deInstallationForm = '/deinstallation-form';
  static const String validateLotNumber = '$deInstallation/validate-lot-number';
  static const String deInstallationSubmit = '$deInstallation/submit';
  static const String updatePrintQuantity =
      '$deInstallation/update-print-quantity';

  // Installation Multiuser
  static const String installationUserList = '$installation/users/list';
  static const String installationAssignSub = '$installation/assign/sub';
  static const String installationAssignForm = '$installation/assign-form';
  static const String installationSubList = '$installation/sub/list';
  static const String installationSubItems = '$installation/sub/items';
  static const String installationSubStatus = '$installation/sub/status';
  static const String installationSubReminder = '$installation/sub/reminder';

  // Contact us and Privacy Policy
  static const String privacyPolicy =
      "https://homeaccess.nationalramp.com/about/privacy-policy/";

  // Case-management
  static const String caseManagement = '/case-management';
  static const String caseManagementList = '$caseManagement/list';
  static const String caseManagementListMerged = '$caseManagement/list-merged';
  static const String caseManagementChangeStatus =
      '$caseManagement/change-state-app';
  static const String caseManagementMultiuserEval =
      '$caseManagement/multiUser-eval';
  static const String caseManagementUnAssignEvalInstall =
      '$caseManagement/unassign-eval-install';

  //caseManagementChangeStatus -> used to schedule eval, save eval form sections data, submit eval form, schedule installation, save installation form sections data, submit installation form,
  static const String caseManagementEvaluationForm =
      '$caseManagement/evaluation-form';
  static const String caseManagementInstallationForm =
      '$caseManagement/installation-form';
  static const String caseManagementInspectionForm =
      '$caseManagement/inspection-form';
  static const String caseManagementUploadFile = '$caseManagement/upload-file';
  static const String caseManagementDetail = '$caseManagement/detail';
  static const String caseManagementMarkAsNonNationalRampDelay =
      '$caseManagement/markAsNonNationalRampDelay';
  static const String caseManagementChangeDate = '$caseManagement/change-date';

  static const String getQuotationByCaseID =
      '$configuratorBaseUrl/GetQuotationByCaseID'; //?caseID=678e203d7ffe69083dc6b232
}
