// screens/payment_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htca_app/constants/colors.dart';
import 'package:htca_app/constants/exports.dart';
import 'package:htca_app/screens/home/appointment/payment_and_confirmation/payment_and_confirmation_controller.dart';

class PaymentScreen extends StatelessWidget {
  // final PaymentController controller = Get.put(PaymentController());

  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.paymentAndConfirmation,
        isTransparent: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<PaymentController>(
          init: PaymentController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDoctorInfo(controller),
                const SizedBox(height: 24),
                _buildPaymentMethods(controller),
                const SizedBox(height: 24),
                _buildCardDetails(controller),
                const SizedBox(height: 24),
                _buildPriceBreakdown(controller),
                const SizedBox(height: 32),
                _buildConfirmButton(controller),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDoctorInfo(PaymentController controller) {
    return Container(
      height: 190.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.cardColor
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              'Dr. Sarah Wilson',
              fontSize: 18, fontWeight: FontWeight.bold
            ),
            12.verticalSpace,
            const TextWidget(
              'Cardiologist',
              color: Colors.grey
            ),
            12.verticalSpace,
            Row(
              children: [
                const Icon(Icons.videocam, size: 24,color: Colors.black,),
                8.horizontalSpace,
                const TextWidget('Video Consultation'),
              ],
            ),
            5.verticalSpace,
            Row(
              children: [
                Assets.icons.watchIcon.svg(color: AppColors.primaryTextColor),
                15.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget('May 25, 2025'),
                    const SizedBox(width: 8),
                    const TextWidget('10:30 AM (30 minutes)',fontSize: 14,),
                  ],
                ),
              ],
            ),
            const Divider(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethods(PaymentController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Payment Method',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildPaymentOption('Credit/Debit Card',Assets.icons.creditCards.svg(),controller),

        const SizedBox(height: 16),
        _buildPaymentOption('Digital Wallet',Assets.icons.gPayCard.svg(),controller),

      ],
    );
  }

  Widget _buildPaymentOption(String title,Widget icon,PaymentController controller) {
    final isSelected = controller.selectedPaymentMethod.value == title;
    return GestureDetector(
      onTap: () => controller.selectPaymentMethod(title),
      child: Container(
        // height: 190.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected ? AppColors.cardColor : AppColors.whiteColor,
          border: Border.all(color:isSelected ? AppColors.cardColor : AppColors.divColor,)
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Obx(() => Radio<String>(
                value: title,
                groupValue: controller.selectedPaymentMethod.value,
                onChanged: (value) => controller.selectPaymentMethod(value!),
              )),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(title),
                  10.verticalSpace,
                  icon,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardDetails(PaymentController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          borderColor: AppColors.divColor,
          title: 'Card Number',
          hintText: '1234 5678 9012 3456',
          onChanged: (value) => controller.cardNumber.value = value,
        ),
        CustomTextField(
          borderColor: AppColors.divColor,
          title: 'Cardholder Name',
          hintText: 'Name on card',
          onChanged: (value) => controller.cardHolderName.value = value,
        ),

        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                borderColor: AppColors.divColor,
                title: 'Expiry Date',
                hintText: 'MM/YY',
                onChanged: (value) => controller.expiryDate.value = value,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextField(
                borderColor: AppColors.divColor,
                title: 'CVV',
                hintText: '123',
                onChanged: (value) => controller.cvv.value = value,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceBreakdown(PaymentController controller) {
    return Container(
      height: 230.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.cardColor
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.verticalSpace,
            const TextWidget(
              'Price Breakdown',
              fontWeight: FontWeight.bold,
            ),
            // const SizedBox(height: 8),
            _buildPriceRow('Subtotal', '\$50.00'),
            _buildPriceRow('Service Tax (10%)', '\$12.00'),
            _buildPriceRow('Booking Fee', '\$5.00'),
             Divider(height: 32,color: AppColors.divColor,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  'Total Amount',
                  fontWeight: FontWeight.bold
                ),
                TextWidget(
                  '\$67.00',
                    fontWeight: FontWeight.bold,

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildConfirmButton(PaymentController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomButton(
        title: 'Confirm & Pay \$67.00',
        onPressed: controller.onToAppointmentBooked,
      ),
    );
  }

  // Widget _buildConfirmButton(PaymentController controller) {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: ElevatedButton(
  //       onPressed: controller.confirmPayment,
  //       style: ElevatedButton.styleFrom(
  //         padding: const EdgeInsets.symmetric(vertical: 16),
  //       ),
  //       child: const Text('Confirm & Pay \$67.00'),
  //     ),
  //   );
  // }
}