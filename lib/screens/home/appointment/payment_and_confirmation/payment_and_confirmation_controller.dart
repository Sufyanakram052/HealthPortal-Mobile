import 'package:get/get.dart';

import '../appointment_booked/appointment_booked.dart';

class PaymentController extends GetxController {
  final selectedPaymentMethod = 'Credit/Debit Card'.obs;
  final cardNumber = ''.obs;
  final cardHolderName = ''.obs;
  final expiryDate = ''.obs;
  final cvv = ''.obs;

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  void confirmPayment() {
    // Implement payment confirmation logic
    Get.snackbar('Success', 'Payment completed successfully');
    // Navigate to confirmation screen
  }
  onToAppointmentBooked(){
    Get.to(()=>const AppointmentBookedScreen());
  }

}