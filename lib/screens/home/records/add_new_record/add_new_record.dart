import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:htca_app/screens/home/profile/profile_controller.dart';
import 'package:htca_app/screens/home/records/record_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../helper/validators.dart';
import '../../../../widgets/common/custom_appbar.dart';
import '../../../../widgets/common/custom_button.dart';
import '../../../../widgets/common/custom_textfield.dart';
import '../../../../widgets/common/text_widget.dart';
import '../../../../widgets/home_widgets/attachement_doc.dart';
import '../../../../widgets/home_widgets/phone_formater.dart';

class AddNewRecordScreen extends StatelessWidget {
  const AddNewRecordScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.medicalRecord,
        isTransparent: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<RecordsController>(
              init: RecordsController(),
              builder: (controller){
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16),
                  child: Form(
                    // key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Full Name
                        CustomTextField(
                          title: "${AppStrings.patientID}",
                          hintText: AppStrings.enterPatientID,
                          controller: controller.patientIdController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),

                        CustomTextField(
                          title: "${AppStrings.recordID}",
                          hintText: AppStrings.enterRecordID,
                          controller: controller.recordIdController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),
                        12.verticalSpace,
                        // Date of Birth Field
                        TextWidget(
                          AppStrings.date,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 8.h),
                        InkWell(
                          onTap: () => controller.selectDate(context),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.divColor),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Obx(() => TextWidget(
                                  controller.selectedDate.value == null
                                      ? 'DD/MM/YYYY'
                                      : "${controller.selectedDate.value!.day}/${controller.selectedDate.value!.month}/${controller.selectedDate.value!.year}",
                                  fontSize: 16,
                                  color: controller.selectedDate.value == null
                                      ? Colors.grey.shade600
                                      : Colors.black,
                                )),
                                Spacer(),
                                Icon(Icons.calendar_today, size: 20, color: Colors.grey.shade600),
                              ],
                            ),
                          ),
                        ),
                        2.verticalSpace,
                        CustomTextField(
                          maxLines: 7,
                          title: "${AppStrings.description}",
                          hintText: AppStrings.enterMedicalRecordDescription,
                          controller: controller.descriptionController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          // validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),
                        12.verticalSpace,
                        AttachmentsWidget(),


                        // const Spacer(),
                        _bottomButton(controller),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }


  Widget _bottomButton(RecordsController controller){
    return  CustomButton(
      onPressed: (){},
      outlinedColor: AppColors.divColor,
      // backgroundColor: AppColors.whiteColor,
      // isOutlined: true,
      title: AppStrings.saveRecord,
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required String hint,
    required Function(String?) onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          hint: TextWidget(
            hint,
            color: Colors.grey.shade600,
          ),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: TextWidget(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildGenderOption(String gender,ProfileController controller ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () => controller.setGender(gender),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: controller.selectedGender == gender
                      ? Colors.blue
                      : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: controller.selectedGender == gender
                  ? Center(
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
              )
                  : null,
            ),
            12.horizontalSpace,
            TextWidget(
              gender,
              fontSize: 16,
            ),
            12.horizontalSpace,
          ],
        ),
      ),
    );
  }

}




