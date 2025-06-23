import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:htca_app/screens/home/profile/profile_controller.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../gen/assets.gen.dart';
import '../../../helper/validators.dart';
import '../../../widgets/common/custom_appbar.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/custom_textfield.dart';
import '../../../widgets/common/text_widget.dart';
import '../../../widgets/home_widgets/phone_formater.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.editProfile,
        showBackIcon: true,
        isTransparent: true,
        actionWidget: Padding(
          padding: const EdgeInsets.
          only(right: 18.0),
          child: TextWidget(
            fontSize: 16,
            AppStrings.save,
            onTap: (){},
            color: AppColors.primary,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<ProfileController>(
              init: ProfileController(),
              builder: (controller){
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16),
                  child: Form(
                    // key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildImageUploader(controller),
                        // Full Name
                        CustomTextField(
                          title: "${AppStrings.firstName}*",
                          hintText: AppStrings.firstName,
                          controller: controller.firstNameController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),
          
                        CustomTextField(
                          title: "${AppStrings.lastName}*",
                          hintText: AppStrings.lastName,
                          controller: controller.lastNameController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),
                        12.verticalSpace,
                        // Date of Birth Field
                        TextWidget(
                          AppStrings.dateOfBirth,
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
                        SizedBox(height: 16.h),
                        // Blood Group Dropdown
                        const TextWidget(
                          AppStrings.bloodGroup,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        2.verticalSpace,
                        _buildBloodGroupDropdown(controller),
                        22.verticalSpace,
                        const TextWidget(
                          AppStrings.gender,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        2.verticalSpace,
                        Row(children: controller.genders.map((gender) =>
                              _buildGenderOption(gender,controller),
                          ).toList(),
                        ),
                        12.verticalSpace,
                        // Phone Number Field
                        TextWidget(
                          AppStrings.phoneNumber,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        3.verticalSpace,
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.divColor),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: TextFormField(
                            controller: controller.phoneController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [controller.phoneFormatter],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 16.h,
                              ),
                              hintText: '+1 (___) ___-____',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 16,
                              ),
                              suffixIcon: Icon(Icons.call, size: 20,color: AppColors.primaryTextColor,),
                            ),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              final unformatted = PhoneFormatter.unformatPhone(value);
                              if (unformatted.length < 10) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          title: "${AppStrings.nationalId}*",
                          hintText: AppStrings.insuranceNumber,
                          controller: controller.insuranceNumberController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          // validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),
                        12.verticalSpace,
                        CustomTextField(
                          title: "${AppStrings.insuranceName}*",
                          hintText: AppStrings.insuranceName,
                          controller: controller.insuranceNameController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          // validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),
                        12.verticalSpace,
                        CustomTextField(
                          title: "${AppStrings.insuranceNumber}*",
                          hintText: AppStrings.insuranceNumber,
                          controller: controller.insuranceNumberController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          // validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),
                        12.verticalSpace,
                        CustomTextField(
                          title: "${AppStrings.emergencyContactName}*",
                          hintText: AppStrings.emergencyContactName,
                          controller: controller.emergencyContactNameController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          // validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),
                        12.verticalSpace,
                        TextWidget(
                          AppStrings.emergencyContactNumber,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        3.verticalSpace,
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.divColor),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: TextFormField(
                            controller: controller.emergencyPhoneController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [controller.phoneFormatter],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 16.h,
                              ),
                              hintText: '+1 (___) ___-____',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 16,
                              ),
                              suffixIcon: Icon(Icons.call, size: 20,color: AppColors.primaryTextColor,),
                            ),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              final unformatted = PhoneFormatter.unformatPhone(value);
                              if (unformatted.length < 10) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                          ),
                        ),
                        // Relation Dropdown
                        CustomTextField(
                          title: "${AppStrings.address}",
                          hintText: AppStrings.address,
                          controller: controller.emergencyContactNameController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          // validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),
                        15.verticalSpace,

                        CustomTextField(
                          title: "${AppStrings.city}*",
                          hintText: AppStrings.city,
                          controller: controller.cityController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          // validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),
                        15.verticalSpace,

                        CustomTextField(
                          title: "${AppStrings.state}*",
                          hintText: AppStrings.state,
                          controller: controller.stateController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          // validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),
                        15.verticalSpace,

                        CustomTextField(
                          title: "${AppStrings.zipCode}*",
                          hintText: AppStrings.zipCode,
                          controller: controller.zipController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          // validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),
                        15.verticalSpace,

                        CustomTextField(
                          title: "${AppStrings.country}*",
                          hintText: AppStrings.country,
                          controller: controller.countryController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          // validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),
                        15.verticalSpace,


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

  Widget _buildImageUploader(ProfileController controller) {
    return Center(
      child: InkWell(
        onTap: (){
          controller.onPickImage();
          // ImagePickerHelper.pickImage(ImageSource.gallery);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 112,
              width: 112,
              decoration: const BoxDecoration(
                  color: AppColors.cardColor,
                  shape: BoxShape.circle
              ),
              child: Center(
                child: Assets.icons.imageUploader.svg(),
              ),
            ),
            7.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.imageUploader.svg(height: 15,width: 15),
                10.horizontalSpace,
                const TextWidget(AppStrings.changePhoto,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRelationDropdown(ProfileController controller) {
    return Obx(() => _buildDropdown(
      value: controller.selectedRelation.value,
      items: controller.relations,
      hint: AppStrings.selectRelation,
      onChanged: controller.updateRelation,
    ));
  }

  Widget _buildAgeDropdown(ProfileController controller) {
    return Obx(() => _buildDropdown(
      value: controller.selectedAge.value,
      items: controller.ages,
      hint: AppStrings.selectAge,
      onChanged: controller.updateAge,
    ));
  }

  Widget _buildBloodGroupDropdown(ProfileController controller) {
    return Obx(() => _buildDropdown(
      value: controller.selectedBloodGroup.value,
      items: controller.bloodGroups,
      hint: AppStrings.selectBloodGroup,
      onChanged: controller.updateBloodGroup,
    ));
  }

  Widget _bottomButton(ProfileController controller){
    return  CustomButton(
      onPressed: (){},
      outlinedColor: AppColors.divColor,
      // backgroundColor: AppColors.whiteColor,
      // isOutlined: true,
      title: AppStrings.saveChanges,
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
