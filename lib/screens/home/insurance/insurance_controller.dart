import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../backend/models/insurance.dart';

class InsuranceController extends GetxController {
  var currentInsurance = Insurance(
    id: '1',
    status: 'Active',
    name: 'HealthCare Plus',
    memberId: 'HC123456789',
    groupNumber: 'GRP987654',
    coveragePeriod: 'Jan 2024 - Dec 2024',
    isActive: true,
  ).obs;

  var editName = ''.obs;
  var editNumber = ''.obs;

  void updateInsurance() {
    currentInsurance.update((val) {
      val?.name = editName.value;
      val?.memberId = editNumber.value;
    });
    Get.back();
  }
}