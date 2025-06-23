import 'package:get/get.dart';
import 'package:htca_app/constants/colors.dart';
import 'package:htca_app/constants/exports.dart';

import '../../../backend/models/dependent.dart';
import '../../../widgets/common/custom_dialogs.dart';
import 'add_dependent/add_dependent.dart';
import 'edit_dependent/edit_dependent.dart';

class DependantsController extends GetxController {
  final dependants = <Dependant>[
    Dependant(
      name: 'Sarah Johnson',
      relation: 'Spouse',
      details: 'Female · 34 years ● O+',
    ),
    Dependant(
      name: 'Michael Johnson',
      relation: 'Son',
      details: 'Male · 8 years ● B+',
    ),
    Dependant(
      name: 'Emma Johnson',
      relation: 'Daughter',
      details: 'Female · 12 years ● A-',
    ),
  ].obs;




  void deleteDependant(int index,BuildContext context) {

    // To show the dialog:
    CustomDeleteDialog.show(
      context: context,
      dependentDetails: 'Female · 34 years ● O+', // Pass the dependent details
      onDelete: () {
        dependants.removeAt(index);
        Get.back();
        print('Dependent deleted');
      },
    );

    // CustomDialogs.showAlert(
    //   title: AppStrings.deleteDependant,
    //   description: AppStrings.deleteDependantDesc,
    //
    // );

    // Get.defaultDialog(
    //   title: 'Delete Dependent',
    //   middleText: 'Are you sure you want to delete ${dependants[index].name}?',
    //   textConfirm: 'Delete',
    //   textCancel: 'Cancel',
    //   confirmTextColor: AppColors.whiteColor,
    //   onConfirm: () {
    //     dependants.removeAt(index);
    //     Get.back();
    //   },
    // );
  }

  onEditDependent(){
    Get.to(()=> EditDependent());
  }
   onToAddNewDependent() {
    Get.to(()=> const AddDependent());
  }
}

