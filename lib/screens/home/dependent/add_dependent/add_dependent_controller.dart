import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/exports.dart';
import '../../../../helper/image_picker_helper.dart';

class AddDependentController extends GetxController {
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

  // Available gender options
  final List<String> genders = ['Male', 'Female', 'Other'];

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

   String _selectedGender = '';

  // Getter for selected gender
  String get selectedGender => _selectedGender;

  // Update selected gender
  void setGender(String gender) {
    _selectedGender = gender;
    update();
  }

  onPickImage() async {
    var image = await ImagePickerHelper.pickImage(ImageSource.gallery);
    log('message is here $image');
  }


  void addDependent(){

  }

}