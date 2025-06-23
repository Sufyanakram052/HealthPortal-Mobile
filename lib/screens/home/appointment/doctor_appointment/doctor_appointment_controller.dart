import 'package:get/get.dart';

import '../book_doctor/book_doctor_screen.dart';

class DoctorController extends GetxController {
  var selectedDepartment = 'All Departments';
  var doctors = <Map<String, String>>[
    {
      'name': 'Dr. Michael Chen',
      'specialty': 'Neurologist',
      'price': '\$180',
      'experience': '12 years',
      'rating': '4.9',
      'image': 'assets/doctor1.png',
    },
    {
      'name': 'Dr. Sarah Wilson',
      'specialty': 'Pediatrician',
      'price': '\$180',
      'experience': '12 years',
      'rating': '4.9',
      'image': 'assets/doctor2.png',
    },
    // Add more sample doctors as needed
  ];

  void changeDepartment(String department) {
    selectedDepartment = department;
    update();

  }

  onBookDoctor(){
    Get.to(()=> BookDoctorAppointmentScreen());
  }

}