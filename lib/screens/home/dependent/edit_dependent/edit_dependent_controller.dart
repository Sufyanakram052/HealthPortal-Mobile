import 'package:htca_app/constants/exports.dart';
import 'package:htca_app/constants/keys.dart';
import 'package:htca_app/helper/storage_helper.dart';

import '../add_dependent/add_dependent.dart';



class EditDependentController extends GetxController {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  // Observable variables
  var selectedRelation = Rx<String?>(null);
  var selectedAge = Rx<String?>(null);
  var selectedBloodGroup = Rx<String?>(null);

  // Dropdown options
  final List<String> relations = [
    'Daughter',
    'Son',
    'Spouse',
    'Father',
    'Mother',
    'Other'
  ];

  final List<String> ages = List.generate(100, (index) => (index + 1).toString());

  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  // Update methods
  void updateRelation(String? value) {
    selectedRelation.value = value;
  }

  void updateAge(String? value) {
    selectedAge.value = value;
  }

  void updateBloodGroup(String? value) {
    selectedBloodGroup.value = value;
  }

}