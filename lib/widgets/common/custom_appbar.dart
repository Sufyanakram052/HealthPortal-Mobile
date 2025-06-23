import 'package:htca_app/constants/exports.dart';
// import 'package:htca_app/core/extensions/buildcontext_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.height = 90, // kToolbarHeight,
    this.leadingWidth,
    this.actionWidget,
    this.titleFontSize,
    this.isTransparent = false,
    this.showBackIcon = true,
    this.leadingWidget,
  });

  final double height;
  final String? title;
  final double? titleFontSize, leadingWidth;
  final Widget? actionWidget, leadingWidget;
  final bool isTransparent, showBackIcon;

  @override
  Size get preferredSize => Size.fromHeight(height.sp);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        centerTitle: false,
        toolbarHeight: height.sp,
        scrolledUnderElevation: 0,
        elevation: isTransparent ? 0 : 0,
        backgroundColor: isTransparent ? Colors.transparent : context.cardColor,
        title: TextWidget(title,
            fontSize: titleFontSize ?? 24, color: AppColors.primaryTextColor),
        leading: showBackIcon
            ? IconButton(
                icon: const Icon(Icons.arrow_back_outlined,color: AppColors.primaryTextColor),
                onPressed: () {
                  Get.back();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ) //BackButton(color: context.onSecondary)
            : leadingWidget,
        leadingWidth: leadingWidth,
        actions: actionWidget != null ? [actionWidget!] : null,
      ),
    );
  }
}
