import 'package:htca_app/constants/exports.dart';

class CustomAssignTaskTabBar extends StatelessWidget {
  const CustomAssignTaskTabBar({
    super.key,
    required this.tabController,
    required this.onTabChanged,
    this.title1,
    this.title2,
  });

  final TabController tabController;
  final void Function(int)? onTabChanged;
  final String? title1, title2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.sp,
      margin: EdgeInsets.only(top: 10.sp),
      color: AppColors.tabBgColor,
      child: TabBar(
        controller: tabController,
        labelColor: context.onSecondary,
        dividerColor: Colors.transparent,
        // context.dividerColor,
        unselectedLabelColor: context.onSecondary.withOpacity(0.5),
        labelPadding: EdgeInsets.zero,
        // padding: EdgeInsets.symmetric(horizontal: 0.2.sw),
        //
        tabAlignment: TabAlignment.fill,
        indicatorSize: TabBarIndicatorSize.tab,
        splashBorderRadius: BorderRadius.circular(8).r,
        labelStyle: Helper.textStyle(),
        unselectedLabelStyle: Helper.textStyle(),
        onTap: onTabChanged,
        tabs: [
          Tab(text: title1 ?? AppStrings.myTasks.tr),
          Tab(text: title2 ?? AppStrings.assignedTask.tr),
        ],
      ),
    );
  }
}
