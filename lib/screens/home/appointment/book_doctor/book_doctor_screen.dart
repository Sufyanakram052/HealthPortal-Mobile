import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htca_app/constants/exports.dart';

import '../../../../widgets/common/custom_button.dart';
import '../../../../widgets/home_widgets/horizontal_calendar.dart';
import '../agora_video/video_call_screen.dart';
import '../appointments_controller.dart';
import 'book_doctor_controller.dart';




class BookDoctorAppointmentScreen extends StatelessWidget {
  final BookDoctorController controller = Get.put(BookDoctorController());

   BookDoctorAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.bookAppointment,
        isTransparent: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _doctorCard(),
            const SizedBox(height: 16),
            SizedBox(
                height: 122,
                child: HorizontalWeekCalendar(onDateSelected: (DateTime ) {  },)),
            // _datePicker(),
            const SizedBox(height: 16),
            const Text('Consultation Type', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _consultationSelector(),
            const SizedBox(height: 16),
            const Text('Available Time Slots', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _timeSlotGrid(),
            const Spacer(),
            CustomButton(title: AppStrings.bookAppointment, onPressed: controller.onToBookAppointmentPayment),
          ],
        ),
      ),
    );
  }

  Widget _doctorCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
       border: Border.all(color: AppColors.divColor)
       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/doctor1.png'),
            ),
           12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  TextWidget('Dr. Michael Chen', fontWeight: FontWeight.bold,fontSize: 16,),
                  4.verticalSpace,
                  TextWidget('Neurologist', fontWeight: FontWeight.w400,fontSize: 14,),
                  5.verticalSpace,

                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.blue, size: 16),
                      6.horizontalSpace,
                      TextWidget('4.4', fontWeight: FontWeight.w600,fontSize: 16,),
                      15.horizontalSpace,
                      TextWidget('14 years', fontWeight: FontWeight.w400,fontSize: 14,),

                    ],
                  ),
                ],
              ),
            ),
             const TextWidget('\$180',fontSize: 16,fontWeight: FontWeight.w500,),
          ],
        ),
      ),
    );
  }

  Widget _datePicker() {
    return GetBuilder<BookDoctorController>(
      init: BookDoctorController(),
      builder: (_) => Row(
        children: List.generate(5, (index) {
          final date = DateTime.now().add(Duration(days: index));
          final isSelected = controller.selectedDate.value.day == date.day;
          return GestureDetector(
            onTap: () => controller.changeDate(date),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text('${date.day}', style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
                  Text(_getWeekday(date), style: TextStyle(fontSize: 12, color: isSelected ? Colors.white : Colors.black)),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  String _getWeekday(DateTime date) {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return days[date.weekday % 7];
  }

  Widget _consultationSelector() {
    return GetBuilder<BookDoctorController>(
      init: BookDoctorController(),
      builder: (_) => Column(
        children: [
          _consultationOption('Video Call', '\$50', '30 mins'),
          const SizedBox(height: 8),
          _consultationOption('In-Person', '\$80', '45 mins'),
        ],
      ),
    );
  }

  Widget _consultationOption(String type, String price, String duration) {
    final isSelected = controller.selectedConsultation.value == type;
    return GestureDetector(
      onTap: () {
        controller.selectConsultation(type);
        Get.to(()=> const VideoCallScreen());
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(type == 'Video Call' ? Icons.videocam : Icons.local_hospital, color: isSelected ? Colors.white : Colors.blue),
                const SizedBox(width: 8),
                Text(type, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
                const SizedBox(width: 8),
                Text(duration, style: TextStyle(color: isSelected ? Colors.white70 : Colors.grey)),
              ],
            ),
            Text(price, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget _timeSlotGrid() {
    return GetBuilder<BookDoctorController>(
      init: BookDoctorController(),
      builder: (_) => Wrap(
        spacing: 8,
        runSpacing: 8,
        children: controller.timeSlots.map((slot) {
          final isSelected = controller.selectedTimeSlot.value == slot;
          return GestureDetector(
            onTap: () => controller.selectTimeSlot(slot),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(slot, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
            ),
          );
        }).toList(),
      ),
    );
  }
}


