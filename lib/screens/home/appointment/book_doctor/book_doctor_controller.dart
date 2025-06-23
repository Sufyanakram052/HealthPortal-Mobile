import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../payment_and_confirmation/payment_and_confirmation.dart';

class BookDoctorController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedConsultation = 'Video Call'.obs;
  var selectedTimeSlot = ''.obs;

  List<String> timeSlots = [
    '09:00 AM', '09:30 AM', '10:00 AM', '10:30 AM',
    '11:00 AM', '11:30 AM', '02:00 PM', '02:30 PM',
  ];

  void changeDate(DateTime date) => selectedDate.value = date;
  void selectConsultation(String type) => selectedConsultation.value = type;
  void selectTimeSlot(String time) => selectedTimeSlot.value = time;










  // final selectedDate = DateTime.now().obs;
  final currentMonth = DateTime.now().obs;

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void nextMonth() {
    currentMonth.value = DateTime(currentMonth.value.year, currentMonth.value.month + 1, 1);
  }

  void prevMonth() {
    currentMonth.value = DateTime(currentMonth.value.year, currentMonth.value.month - 1, 1);
  }

  String getMonthYear() => DateFormat('MMMM yyyy').format(currentMonth.value);

  String getDayName(DateTime date) => DateFormat('E').format(date)[0];

  bool isSelected(DateTime date) =>
      date.year == selectedDate.value.year &&
          date.month == selectedDate.value.month &&
          date.day == selectedDate.value.day;


  onToBookAppointmentPayment(){
    Get.to(()=> const PaymentScreen());
  }

}
