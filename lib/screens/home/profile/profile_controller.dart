import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/exports.dart';
import '../../../../helper/image_picker_helper.dart';
import '../../../widgets/home_widgets/phone_formater.dart';

class ProfileController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fullNameNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emergencyPhoneController = TextEditingController();
  final TextEditingController insuranceNumberController = TextEditingController();
  final TextEditingController emergencyContactNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController insuranceNameController = TextEditingController();

  final phoneFormatter = PhoneFormatter.getFormatter();


// Add this to clear controllers when done
  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

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


  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final dateController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary, // Header color
              onPrimary: AppColors.whiteColor,// Header text color
              onSurface: AppColors.primary, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      dateController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }
}