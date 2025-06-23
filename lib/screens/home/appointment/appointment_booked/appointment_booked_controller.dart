// controllers/appointment_controller.dart
import 'package:get/get.dart';
import 'package:htca_app/screens/home/appointment/appointment_invoice/appointment_invoice.dart';

class AppointmentBookedController extends GetxController {
  final appointmentDetails = {
    'doctorName': 'Dr. Sarah Wilson',
    'specialty': 'Cardiologist',
    'date': 'Monday, March 4, 2024',
    'time': '10:30 AM',
    'location': 'Medical Center, Floor 3, Room 302',
    'appointmentId': '#APT20240304',
    'duration': '30 minutes',
  }.obs;

  final isAddedToCalendar = false.obs;

  void toggleCalendar() {
    isAddedToCalendar.value = !isAddedToCalendar.value;
  }
  onToInvoiceScreen(){
    Get.to(()=>AppointmentInvoicePage());
  }
}