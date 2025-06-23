import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:htca_app/constants/colors.dart';
import 'package:htca_app/constants/exports.dart';
import 'package:htca_app/constants/strings.dart';
import 'package:htca_app/screens/home/records/record_controller.dart';
import 'package:htca_app/widgets/common/custom_appbar.dart';
import 'package:htca_app/widgets/common/text_widget.dart';

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.medicalRecords,
        isTransparent: true,
        // centerTitle: true,
      ),
      body: GetBuilder(
          init: RecordsController(),
          builder: (controller){
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              _buildSearchBar(controller),
              // SizedBox(height: 24.h),
              _buildAddRecordButton(controller),
              SizedBox(height: 24.h),
              _buildRecordsTableHeader(controller),
              SizedBox(height: 8.h),
              Expanded(
                child: Obx(() => _buildRecordsList(controller)),
              ),
            ],
          ),
        );
      }),
    );
  }


  Widget _buildSearchBar(RecordsController controller) {
    return CustomTextField(
      onChanged: (value) => controller.searchQuery.value = value,
      borderColor: AppColors.divColor,
      prefixIcon:  Icon(Icons.search, color: AppColors.primaryTextColor, size: 20.sp),
    );
  }

  Widget _buildAddRecordButton(RecordsController controller) {
    return CustomButton(
      title:AppStrings.addNewRecord,
      textFontSize: 16,
      onPressed: controller.onAddNewRecord,
    );
  }

  Widget _buildRecordsTableHeader(RecordsController controller) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.lightPrimary,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextWidget(
              'ID',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            flex: 3,
            child: TextWidget(
              'Date',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            flex: 5,
            child: TextWidget(
              'Description',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecordsList(RecordsController controller) {
    return ListView.separated(
      itemCount: controller.filteredRecords.length,
      separatorBuilder: (context, index) => Divider(height: 1.h),
      itemBuilder: (context, index) {
        final record = controller.filteredRecords[index];
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: TextWidget(
                  record.id,
                  fontSize: 14.sp,
                ),
              ),
              Expanded(
                flex: 3,
                child: TextWidget(
                  '${record.date.year}-${record.date.month.toString().padLeft(2, '0')}-${record.date.day.toString().padLeft(2, '0')}',
                  fontSize: 14.sp,
                ),
              ),
              Expanded(
                flex: 4,
                child: TextWidget(
                  record.description,
                  fontSize: 14.sp,
                  maxLines: 1,
                  //overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 1,
                child: Assets.icons.edit.svg(),
              ),
            ],
          ),
        );
      },
    );
  }
}