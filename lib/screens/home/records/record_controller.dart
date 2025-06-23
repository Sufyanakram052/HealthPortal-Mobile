import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../backend/models/records.dart';
import '../../../constants/exports.dart';
import '../../../constants/strings.dart';
import '../../../helper/image_picker_helper.dart';
import '../../../widgets/common/custom_toast.dart';
import 'add_new_record/add_new_record.dart';

class RecordsController extends GetxController {


  TextEditingController patientIdController = TextEditingController();
  TextEditingController recordIdController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final List<String> _attachmentUrls = [];
  bool _isLoading = false;

  List<String> get attachmentUrls => _attachmentUrls;
  bool get isLoading => _isLoading;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final dateController = TextEditingController();



  final RxList<MedicalRecord> records = <MedicalRecord>[
    MedicalRecord(
      id: 'MR001',
      date: DateTime(2024, 2, 15),
      description: 'Annual Check-up',
    ),
    MedicalRecord(
      id: 'MR002',
      date: DateTime(2024, 2, 10),
      description: 'Blood Test Results',
    ),
    MedicalRecord(
      id: 'MR003',
      date: DateTime(2024, 2, 5),
      description: 'Vaccination',
    ),
    MedicalRecord(
      id: 'MR004',
      date: DateTime(2024, 2, 1),
      description: 'Dental Check-up',
    ),
  ].obs;

  final RxString searchQuery = ''.obs;

  List<MedicalRecord> get filteredRecords {
    if (searchQuery.isEmpty) return records;
    return records.where((record) =>
    record.id.toLowerCase().contains(searchQuery.toLowerCase()) ||
        record.description.toLowerCase().contains(searchQuery.toLowerCase())
    ).toList();
  }

  onAddNewRecord(){
    Get.to(()=> const AddNewRecordScreen());

  }




  // Future<void> addAttachment() async {
  //   _isLoading = true;
  //   update();
  //
  //   try {
  //     final fileUrl = await ImagePickerHelper.pickAndUploadFile();
  //     if (fileUrl != null) {
  //       _attachmentUrls.add(fileUrl);
  //       update();
  //     }
  //   } finally {
  //     _isLoading = false;
  //     update();
  //   }
  // }
  Future<void> addAttachment() async {
    final hasPermission = await ImagePickerHelper.checkPermission();
    if (!hasPermission) return;

    _isLoading = true;
    update();

    try {
      final fileUrl = await ImagePickerHelper.pickAndUploadFile();
      if (fileUrl != null) {
        _attachmentUrls.add(fileUrl);
        update();
      }
    } finally {
      _isLoading = false;
      update();
    }
  }

  void removeAttachment(int index) {
    _attachmentUrls.removeAt(index);
    update();
  }
  static Future<bool> checkPermission() async {
    if (Platform.isAndroid) {
      // For Android 13+ (API 33+)
      if (await Permission.mediaLibrary.request().isGranted) {
        return true;
      }

      // For Android 10-12
      if (await Permission.storage.request().isGranted) {
        return true;
      }

      // For Android 9 and below
      if (await Permission.manageExternalStorage.request().isGranted) {
        return true;
      }

      // For camera if needed
      if (await Permission.camera.request().isGranted) {
        return true;
      }

      CustomToast.show(message: AppStrings.permissionDenied);
      return false;
    } else if (Platform.isIOS) {
      // For iOS
      final status = await Permission.photos.request();
      if (status.isGranted) {
        return true;
      }
      CustomToast.show(message: AppStrings.permissionDenied);
      return false;
    }
    return true; // For other platforms
  }


  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),//DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.whiteColor,
              onSurface: AppColors.primary,
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

