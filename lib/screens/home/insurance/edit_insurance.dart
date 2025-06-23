import 'package:get/get.dart';

import '../../../constants/exports.dart';
import 'insurance_controller.dart';

class EditInsuranceScreen extends StatelessWidget {
  final InsuranceController controller = Get.find();

   EditInsuranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.edit,
        isTransparent: true,
      ),
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () => Get.back(),
      //   ),
      //   title: Text('Edit Insurance', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: GetBuilder<InsuranceController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              CustomTextField(
                title: 'Insurance Name*',

                initialValue: controller.currentInsurance.value.name,
                onChanged: (value) => controller.editName.value = value,
                borderColor: AppColors.divColor,
              ),
              CustomTextField(
                borderColor: AppColors.divColor,
                  title: 'Insurance Number*',
                initialValue: controller.currentInsurance.value.memberId,
                onChanged: (value) => controller.editNumber.value = value,
              ),
              CustomButton(
                onPressed: controller.updateInsurance,
                title: AppStrings.saveChanges,
              ),
            ],
          ),
        ),
      ),
    );
  }
}