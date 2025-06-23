import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/exports.dart';
import '../../../../helper/image_picker_helper.dart';
import 'add_dependent_controller.dart';

class AddDependent extends StatelessWidget {
  const AddDependent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.addDependent,
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
        child: Container(
          // height: 0.95.sh,
          // padding: const EdgeInsets.all(20).r,
          child:GetBuilder<AddDependentController>(
              init: AddDependentController(),
              builder: (controller){
                return Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildImageUploader(controller),
                        // Full Name
                        CustomTextField(
                          title: AppStrings.fullName,
                          hintText: AppStrings.fullName,
                          controller: controller.fullNameNameController,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          validator: Validaters.validateName,
                          borderColor: AppColors.divColor,
                        ),

                        const TextWidget(
                          AppStrings.gender,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: controller.genders.map((gender) =>
                              _buildGenderOption(gender,controller),
                          ).toList(),
                          // )
                        ),
                        // Relation Dropdown
                        const TextWidget(
                          AppStrings.relation,
                          // 'Relation',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 8),
                        _buildRelationDropdown(controller),
                        const SizedBox(height: 20),

                        // Age Dropdown
                        const TextWidget(
                          AppStrings.age,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 8),
                        _buildAgeDropdown(controller),
                        const SizedBox(height: 20),

                        // Blood Group Dropdown
                        const TextWidget(
                          AppStrings.bloodGroup,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 8),
                        _buildBloodGroupDropdown(controller),
                        const Spacer(),
                        _bottomButton(controller),
                      ],
                    ),
                  ),
                );
              })
        ),
      ),
    );
  }

  Widget _buildImageUploader(AddDependentController controller) {
    return Center(
      child: InkWell(
        onTap: (){
          controller.onPickImage();
          // ImagePickerHelper.pickImage(ImageSource.gallery);
        },
        child: Column(
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
            const TextWidget(AppStrings.uploadPhoto,
            fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            3.verticalSpace,
            const TextWidget(AppStrings.tapToUpload,
            fontSize: 14,
              fontWeight: FontWeight.normal,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRelationDropdown(AddDependentController controller) {
    return Obx(() => _buildDropdown(
      value: controller.selectedRelation.value,
      items: controller.relations,
      hint: AppStrings.selectRelation,
      onChanged: controller.updateRelation,
    ));
  }

  Widget _buildAgeDropdown(AddDependentController controller) {
    return Obx(() => _buildDropdown(
      value: controller.selectedAge.value,
      items: controller.ages,
      hint: AppStrings.selectAge,
      onChanged: controller.updateAge,
    ));
  }

  Widget _buildBloodGroupDropdown(AddDependentController controller) {
    return Obx(() => _buildDropdown(
      value: controller.selectedBloodGroup.value,
      items: controller.bloodGroups,
      hint: AppStrings.selectBloodGroup,
      onChanged: controller.updateBloodGroup,
    ));
  }

  Widget _bottomButton(AddDependentController controller){
    return  CustomButton(
      onPressed: (){},
      outlinedColor: AppColors.divColor,
      // backgroundColor: AppColors.whiteColor,
      // isOutlined: true,
      title: AppStrings.addDependent,
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

  Widget _buildGenderOption(String gender,AddDependentController controller ) {
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
