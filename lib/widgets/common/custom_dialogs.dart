import 'package:htca_app/constants/exports.dart';

// import '../../screens/home/account/account_controller.dart';

class CustomDialogs {
  static void dismiss() {
    if (Get.isDialogOpen == true) Get.back();
  }

  static void showLoading() {
    Get.dialog(
      const Loader(isDialog: true),
      barrierColor: Colors.black26,
      barrierDismissible: false,
    );
  }

  static Future showAlert({
    String? title,
    String? description,
    String? notButtonText,
    String? yesButtonText,
    Widget? centerWidget,
    VoidCallback? onYesTap,
    VoidCallback? onNoTap,
    Widget? icon,
    bool? barrierDismissible,
    final Color? noButtonColor = Colors.transparent,
    final Color? noButtonTextColor,
  }) async {
    await Get.dialog(
      CustomAlertDialog(
        icon: icon,
        title: title,
        description: description,
        notButtonText: notButtonText,
        yesButtonText: yesButtonText,
        centerWidget: centerWidget,
        onYesTap: onYesTap,
        onNoTap: onNoTap,
        noButtonColor: noButtonColor,
        noButtonTextColor: noButtonTextColor,
      ),
      barrierDismissible: barrierDismissible ?? true,
    );
  }

  static Future showDelete({
    String? title,
    String? description,
    String? notButtonText,
    String? yesButtonText,
    Widget? centerWidget,
    VoidCallback? onYesTap,
    VoidCallback? onNoTap,
    Widget? icon,
    bool? barrierDismissible,
    final Color? noButtonColor = Colors.transparent,
    final Color? noButtonTextColor,
  }) async {
    await Get.dialog(
      CustomAlertDialog(
        icon: icon,
        title: title,
        description: description,
        notButtonText: notButtonText,
        yesButtonText: yesButtonText,
        centerWidget: centerWidget,
        onYesTap: onYesTap,
        onNoTap: onNoTap,
        noButtonColor: noButtonColor,
        noButtonTextColor: noButtonTextColor,
      ),
      barrierDismissible: barrierDismissible ?? true,
    );
  }



}




class CustomDeleteDialog extends StatelessWidget {
  final String dependentDetails;
  final VoidCallback onDelete;

  const CustomDeleteDialog({
    super.key,
    required this.dependentDetails,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:  AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Assets.icons.delete.svg(color: AppColors.primaryTextColor),
                SizedBox(width: 8),
                TextWidget(
                  AppStrings.deleteDependant,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  // color: AppColors.whiteColor,
                ),
              ],
            ),
            SizedBox(height: 8),

            // Confirmation text
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: TextWidget(
                AppStrings.areYouSureToDeletePart,
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24),

            // Buttons row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: TextWidget(
                    AppStrings.cancel,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onDelete();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                  child: TextWidget(
                    AppStrings.delete,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static void show({
    required BuildContext context,
    required String dependentDetails,
    required VoidCallback onDelete,
  }) {
    showDialog(
      context: context,
      builder: (context) => CustomDeleteDialog(
        dependentDetails: dependentDetails,
        onDelete: onDelete,
      ),
    );
  }
}


class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    this.icon,
    this.title,
    this.description,
    this.onYesTap,
    this.onNoTap,
    this.centerWidget,
    this.notButtonText,
    this.yesButtonText,
    this.noButtonColor,
    this.noButtonTextColor,
  });

  final String? title, description, notButtonText, yesButtonText;
  final VoidCallback? onYesTap, onNoTap;
  final Widget? icon, centerWidget;
  final Color? noButtonColor, noButtonTextColor;

  static void dismiss() {
    if (Get.isDialogOpen == true) Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: context.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12).r,
      ),
      title: Column(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 20).r,
              child: icon,
            ),
          TextWidget(
            title,
            maxLines: 3,
            fontSize: 24,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: Wrap(
        alignment: WrapAlignment.center,
        children: [
          TextWidget(
            description,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w400,
            color: context.onSecondary.withOpacity(0.9),
            maxLines: 3,
            fontSize: 14,
          ),
          centerWidget ?? const SizedBox.shrink(),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: CustomButton(
                outlinedColor: noButtonColor != Colors.transparent
                    ? Colors.transparent
                    : null,
                title: notButtonText ?? AppStrings.no,
                textColor: noButtonTextColor ?? Colors.white,
                height: 40,
                backgroundColor: noButtonColor,
                isOutlined: true,
                onPressed: () {
                  dismiss();
                  if (onNoTap != null) onNoTap!();
                },
              ),
            ),
            if (onYesTap != null) ...[
              10.horizontalSpace,
              Expanded(
                child: CustomButton(
                  height: 40,
                  title: yesButtonText ?? AppStrings.yes,
                  onPressed: () {
                    dismiss();
                    if (onYesTap != null) onYesTap!();
                  },
                ),
              ),
            ]
          ],
        ),
      ],
    );
  }
}

// class CustomLocationAlertDialog extends StatelessWidget {
//   const CustomLocationAlertDialog({
//     super.key,
//     this.icon,
//     this.title,
//     this.description,
//     this.onYesTap,
//     this.onNoTap,
//     this.centerWidget,
//     this.notButtonText,
//     this.yesButtonText,
//     this.controller,
//   });
//
//   final String? title, description, notButtonText, yesButtonText;
//   final VoidCallback? onYesTap, onNoTap;
//   final Widget? icon, centerWidget;
//
//   final AccountController? controller;
//
//   static void dismiss() {
//     if (Get.isDialogOpen == true) Get.back();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     User? user = controller?.user;
//
//     return AlertDialog(
//       elevation: 0,
//       backgroundColor: context.scaffoldBackgroundColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12).r,
//       ),
//       title: TextWidget(
//         title,
//         maxLines: 3,
//         fontSize: 24,
//         textAlign: TextAlign.center,
//       ),
//       content: SizedBox(
//         height: 200,  // Set a fixed height for the ListView
//         child: ListView.builder(
//           shrinkWrap: true,  // Allows the ListView to take only as much space as needed
//           itemCount: user?.location?.length ?? 0,  // Handle null list safely
//           itemBuilder: (context, index) {
//             String? location = user?.location?[index].name;
//             String? warehouse = user?.location?[index].warehouse;
//
//             return TextWidget(
//               '${location ?? ''}${warehouse != null ? ', $warehouse' : ''}',
//               textAlign: TextAlign.center,
//               fontWeight: FontWeight.w400,
//               color: context.onSecondary.withOpacity(0.9),
//               maxLines: 3,
//               fontSize: 14,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
