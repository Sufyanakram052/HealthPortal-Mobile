import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htca_app/constants/exports.dart';

import '../../../backend/models/dependent.dart';
import 'dependent_controller.dart';

class DependentsScreen extends StatelessWidget {
  final DependantsController controller = Get.put(DependantsController());

  DependentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.dependents,
        isTransparent: true,
        showBackIcon: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Section
            _buildSearchSection(),
            SizedBox(height: 24),

            // Dependants List
            Obx(() => Column(
              children: [
                for (int i = 0; i < controller.dependants.length; i++)
                  Column(
                    children: [
                      _buildDependantItem(controller.dependants[i], i,context),
                      if (i < controller.dependants.length - 1)
                        Divider(height: 32),
                    ],
                  ),
              ],
            )),
            SizedBox(height: 32),

            // Add New Dependant Button
            _buildAddNewButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchSection() {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey,),
          SizedBox(width: 8),
          TextWidget(
            AppStrings.searchDependants,
            color: Colors.grey,
            fontSize: 14,
          ),
        ],
      ),
    );
  }

  Widget _buildDependantItem(Dependant dependant, int index, BuildContext context) {
    return Container(
      height: 100.h,
      // color: Colors.pink,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red
              ),
            ),
          ),
          20.horizontalSpace,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  dependant.name,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4),
                TextWidget(
                  dependant.relation,
                  fontSize: 14,
                  color: AppColors.secFontColor
                ),
                SizedBox(height: 8),
                TextWidget(
                  dependant.details,
                  fontSize: 14,
                  color: AppColors.secFontColor
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            children: [
              InkWell(
                  onTap:  () => controller.onEditDependent(),
                  child: Assets.icons.edit.svg()),
              20.horizontalSpace,
              InkWell(
                  onTap:  () => controller.deleteDependant(index,context),
                  child: Assets.icons.delete.svg()),
              20.horizontalSpace,
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAddNewButton() {
    return CustomButton(
      onPressed: controller.onToAddNewDependent,
      title: AppStrings.addNewDependant,
      textColor: AppColors.whiteColor,
    );
    // return Center(
    //   child: TextButton.icon(
    //     icon: Icon(Icons.add, color: Colors.blue),
    //     label: TextWidget(
    //       'Add New Dependant',
    //       color: Colors.blue,
    //       fontSize: 16,
    //       fontWeight: FontWeight.bold,
    //     ),
    //     onPressed: () {
    //       // Navigate to add new dependant screen
    //     },
    //     style: TextButton.styleFrom(
    //       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(8),
    //         side: BorderSide(color: Colors.blue),
    //       ),
    //     ),
    //   ),
    // );
  }
}