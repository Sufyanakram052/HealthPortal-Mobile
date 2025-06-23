// screens/appointment_confirmation_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htca_app/constants/colors.dart';
import 'package:htca_app/constants/exports.dart';
import 'appointment_booked_controller.dart';

class AppointmentBookedScreen extends StatelessWidget {
  const AppointmentBookedScreen({super.key});

  // final AppointmentBookedController controller = Get.put(AppointmentBookedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<AppointmentBookedController>(
            init: AppointmentBookedController(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildSuccessHeader(controller),
                  const SizedBox(height: 24),
                  _buildDoctorInfo(controller),
                  const SizedBox(height: 24),
                  //_buildAppointmentDetails(controller),
                  _buildActionButtons(controller),
                  const SizedBox(height: 32),
                  _buildSupportLink(controller),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessHeader(AppointmentBookedController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Icon(Icons.check_circle, size: 60, color: AppColors.primary),
        const SizedBox(height: 16),
        TextWidget(
          textAlign: TextAlign.center,
          AppStrings.appointmentBookedSuccessfully,
          fontSize: 24,
          fontWeight: FontWeight.bold,

        ),
        const SizedBox(height: 8),
        TextWidget(
          AppStrings.yourAppointmentHasBeenConfirmed,
          color: AppColors.secFontColor,
        ),
      ],
    );
  }

  Widget _buildDoctorInfo(AppointmentBookedController controller) {
    return Container(
      height: 338.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.cardColor
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(

                children: [
                  Container(
                    height: 66,
                    width: 66,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                        color: AppColors.redColor
                    ),
                  ),
                  12.horizontalSpace,
                  Container(
                    height: 66,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.appointmentDetails['doctorName']!,
                          style: Get.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          controller.appointmentDetails['specialty']!,
                          style: Get.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // const Divider(height: 32),
            _buildDetailItem(controller.appointmentDetails['date']!,Icon(Icons.calendar_month,color: AppColors.primaryTextColor,)),
            _buildDetailItem(
              controller.appointmentDetails['time']!,
                Assets.icons.watchIcon.svg(color: AppColors.primaryTextColor)
            ),
            _buildDetailItem(controller.appointmentDetails['location']!,Icon(Icons.location_on,color: AppColors.primaryTextColor,)),
            const SizedBox(height: 16),
            Divider(color: AppColors.divColor,indent: 12,endIndent: 12,),
            _buildDetailRow('Appointment ID', controller.appointmentDetails['appointmentId']!),
            _buildDetailRow('Duration', controller.appointmentDetails['duration']!),
          ],
        ),
      ),
    );
  }



  Widget _buildDetailItem(String text, Widget icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 12),
          TextWidget(text),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            label,
          ),
          TextWidget(value),
        ],
      ),
    );
  }

  Widget _buildActionButtons(AppointmentBookedController controller) {
    return Column(
      children: [
        CustomButton(

          backgroundColor: AppColors.divColor,
          outlinedColor: AppColors.redColor,
          onPressed: controller.onToInvoiceScreen,
          title: AppStrings.viewInvoice,
        ),
        12.verticalSpace,
        CustomButton(
          isOutlined: true,
          onPressed: (){},
          title: AppStrings.addToCalendar,
          textColor: AppColors.primaryTextColor,
        ),
      ],
    );
  }

  // Widget _buildActionButtons(AppointmentBookedController controller) {
  //   return Column(
  //     children: [
  //       SizedBox(
  //         width: double.infinity,
  //         child: OutlinedButton(
  //           onPressed: () {
  //             // Handle view invoice
  //           },
  //           child: const Text('View Invoice'),
  //         ),
  //       ),
  //       const SizedBox(height: 12),
  //       Obx(() => CheckboxListTile(
  //         title: const Text('Add to Calendar'),
  //         value: controller.isAddedToCalendar.value,
  //         onChanged: (_) => controller.toggleCalendar(),
  //         controlAffinity: ListTileControlAffinity.leading,
  //         contentPadding: EdgeInsets.zero,
  //       )),
  //     ],
  //   );
  // }

  Widget _buildSupportLink(AppointmentBookedController controller) {
    return Center(
      child: TextButton(
        onPressed: () {
          // Handle contact support
        },
        child: TextWidget('Need help? Contact support →',color: AppColors.primaryTextColor,),
      ),
    );
  }
}