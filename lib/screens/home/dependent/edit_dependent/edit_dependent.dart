import 'package:get/get.dart';

import '../../../../constants/exports.dart';
import 'edit_dependent_controller.dart';

// class EditDependent extends StatelessWidget {
//   const EditDependent({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(
//         title: AppStrings.editDependentDetails,
//         isTransparent: true,
//         showBackIcon: true,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             // height: 0.95.sh,
//             padding: const EdgeInsets.all(20).r,
//             child: GetBuilder<EditDependentController>(
//               init: EditDependentController(),
//               builder: (controller) {
//                 return Form(
//                   //key: controller.formKey,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                       // SizedBox(height: 0.02.sh),
//                       // 50.verticalSpace,
//                       // AppLogo(size: 100.sp, nrSize: 50.sp),
//                       // const TextWidget(
//                       //   AppStrings.createAccount,
//                       //   fontSize: 24,
//                       //   color: AppColors.primaryTextColor,
//                       // ),
//                       const TextWidget(
//                         AppStrings.pleaseFillInYourInformation,
//                         fontSize: 16,
//                         color: AppColors.secFontColor,
//                       ),
//                       10.verticalSpace,
//                       CustomTextField(
//                         title: AppStrings.fullName,
//                         hintText: AppStrings.fullName,
//                         controller: controller.fullNameNameController,
//                         keyboardType: TextInputType.name,
//                         textCapitalization: TextCapitalization.none,
//                         validator: Validaters.validateName,
//                       ),
//                       // TextWidget(AppStrings.mustBeAtLeastCharacters,fontSize: 12,),
//                       20.verticalSpace,
//                       CustomButton(
//                         onPressed: controller.onSignUp,
//                         title: AppStrings.createAccount,
//                       ),
//                       20.verticalSpace,
//
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



class EditDependent extends StatelessWidget {
  EditDependent({super.key});


  final EditDependentController controller = Get.put(EditDependentController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.editDependentDetails,
        isTransparent: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            // Relation Dropdown
            const TextWidget(
              AppStrings.relation,
              // 'Relation',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            _buildRelationDropdown(),
            const SizedBox(height: 20),

            // Age Dropdown
            const TextWidget(
              AppStrings.age,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            _buildAgeDropdown(),
            const SizedBox(height: 20),

            // Blood Group Dropdown
            const TextWidget(
              AppStrings.bloodGroup,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            _buildBloodGroupDropdown(),
            const Spacer(),
            _bottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildRelationDropdown() {
    return Obx(() => _buildDropdown(
      value: controller.selectedRelation.value,
      items: controller.relations,
      hint: AppStrings.selectRelation,
      onChanged: controller.updateRelation,
    ));
  }

  Widget _buildAgeDropdown() {
    return Obx(() => _buildDropdown(
      value: controller.selectedAge.value,
      items: controller.ages,
      hint: AppStrings.selectAge,
      onChanged: controller.updateAge,
    ));
  }

  Widget _buildBloodGroupDropdown() {
    return Obx(() => _buildDropdown(
      value: controller.selectedBloodGroup.value,
      items: controller.bloodGroups,
      hint: AppStrings.selectBloodGroup,
      onChanged: controller.updateBloodGroup,
    ));
  }

  Widget _bottomButton(){
    return Column(
      children: [
        CustomButton(
          onPressed: (){},
          outlinedColor: AppColors.divColor,
          backgroundColor: AppColors.whiteColor,
          textColor: AppColors.primaryTextColor,
          isOutlined: true,
          title: AppStrings.cancel,
        ),
        20.verticalSpace,
        CustomButton(
          onPressed: (){},
          outlinedColor: AppColors.divColor,
          // backgroundColor: AppColors.whiteColor,
          // isOutlined: true,
          title: AppStrings.saveChanges,
        ),
        20.verticalSpace,
      ],
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

}