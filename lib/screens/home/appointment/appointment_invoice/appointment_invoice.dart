import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htca_app/constants/exports.dart';
import 'package:intl/intl.dart';

import 'appointment_invoice_controller.dart';

class AppointmentInvoicePage extends StatelessWidget {
  final InvoiceController controller = Get.put(InvoiceController());

  AppointmentInvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(
      //   title: AppStrings.bookAppointment,
      // ),
      body: SafeArea(
        child: GetBuilder<InvoiceController>(
          builder: (controller) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Assets.icons.appLogo.svg(height: 34,width: 34),
                  8.verticalSpace,
                  _buildHeader(controller),
                  20.verticalSpace,
                  // const SizedBox(height: 24),
                  _buildPatientInfo(controller),
                  20.verticalSpace,
                  _buildVisitInfo(controller),
                  20.verticalSpace,
                  _buildInvoiceItems(context, controller),
                  20.verticalSpace,
                  //  _buildTotals(controller),
                  // 20.verticalSpace,
                  // _buildPaymentInfo(),
                  // 20.verticalSpace,
                  // _buildActionButtons(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(InvoiceController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              controller.invoice.invoiceNumber,
                fontSize: 18,
                fontWeight: FontWeight.bold,

            ),
            TextWidget(
              DateFormat('MMMM d, y').format(controller.invoice.invoiceDate),
                fontSize: 16,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: 350.w,
          height: 160.h,
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            // border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  controller.invoice.doctor.name,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                TextWidget(
                  controller.invoice.doctor.specialty,
                  // style: const TextStyle(
                    fontSize: 14,
                  // ),
                ),
                const SizedBox(height: 8),
                5.verticalSpace,
                Row(
                  children: [
                    Icon(Icons.location_on,color: AppColors.primaryTextColor,size: 18,),
                    6.horizontalSpace,
                    TextWidget(
                      controller.invoice.doctor.address,
                        fontSize: 14,
                    ),
                  ],
                ),
                5.verticalSpace,
                Row(
                  children: [
                    Icon(Icons.call,color: AppColors.primaryTextColor,size: 18,),
                    6.horizontalSpace,
                    TextWidget(
                      controller.invoice.doctor.phone,
                        fontSize: 14,
                    ),
                  ],
                ),
                5.verticalSpace,
                Row(
                  children: [
                    Icon(Icons.email,color: AppColors.primaryTextColor,size: 18,),
                    6.horizontalSpace,
                    TextWidget(
                      controller.invoice.doctor.email,
                        fontSize: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPatientInfo(InvoiceController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextWidget(
          AppStrings.patientInformation,
          // style: TextStyle(
          //   fontSize: 16,
            fontWeight: FontWeight.bold,
          // ),
        ),
        const SizedBox(height: 8),
        TextWidget(
          controller.invoice.patient.name,
          // style: const TextStyle(
            fontSize: 16,
          fontWeight: FontWeight.w700,
          // ),
        ),
        TextWidget(
          controller.invoice.patient.patientId,
          // style: const TextStyle(
            fontSize: 14,
          // ),
        ),
      ],
    );
  }

  Widget _buildVisitInfo(InvoiceController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              AppStrings.dateOfVisit,
                fontSize: 14,
                fontWeight: FontWeight.w700,
            ),
            TextWidget(
              DateFormat('MMMM d, y').format(controller.invoice.visitDate),
                fontSize: 14,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              AppStrings.paymentMethod,
                fontSize: 14,
                fontWeight: FontWeight.w700,

            ),
            TextWidget(
              controller.invoice.paymentMethod,
                fontSize: 14,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInvoiceItems(BuildContext context, InvoiceController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Column(
            children: [
              Container(
                height: 44.h,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12) )
                ),
                child: const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        'Description',
                        // style: TextStyle(
                        color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        // ),
                      ),
                      TextWidget(
                        'Qty',
                        // style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        // ),
                      ),
                      TextWidget(
                        'Amount',
                        // style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
              // Invoice Header

              const SizedBox(height: 16),

              // Invoice Items
              _buildInvoiceItem('Consultation', 1, 150.00),
              _buildInvoiceItem('ECG Test', 1, 75.00),
            ],
          ),
        ),

        //const Divider(thickness: 1, height: 24,endIndent: 12,indent: 12,color: AppColors.divColor,),
        12.verticalSpace,
        // Totals
        Container(
          decoration: BoxDecoration(
              color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildTotalRow('Subtotal', 225.00),
                _buildTotalRow('VAT (5%)', 11.25),
                _buildTotalRow('Discount (10%)', -22.50),

                Divider(thickness: 1, height: 24,endIndent: 12,indent: 12,color: AppColors.divColor,),

                // Total Amount
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextWidget(
                      'Total Amount',
                      // style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      // ),
                    ),
                    TextWidget(
                      '\$213.75',
                      // style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        // color: Theme.of(context).primaryColor,
                      // ),
                    ),
                  ],
                ),
                10.verticalSpace,
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Payment Information
        const TextWidget(
          'Payment Information',
            fontWeight: FontWeight.bold,
            fontSize: 16,
        ),
        const SizedBox(height: 8),
        _buildPaymentInfoRow('Bank Name', 'MediBank National'),
        _buildPaymentInfoRow('Account Number', '****3456'),
        _buildPaymentInfoRow('Swift Code', 'MDBNK123'),

        // const SizedBox(height: 24),

        // Action Buttons
        // Row(
        //   children: [
        //     Expanded(
        //       child: ElevatedButton(
        //         style: ElevatedButton.styleFrom(
        //           backgroundColor: Colors.white,
        //           foregroundColor: Theme.of(context).primaryColor,
        //           side: BorderSide(
        //             color: Theme.of(context).primaryColor,
        //           ),
        //           padding: const EdgeInsets.symmetric(vertical: 12),
        //         ),
        //         onPressed: () {},
        //         child: const Text('Download PDF'),
        //       ),
        //     ),
        //     const SizedBox(width: 16),
        //     Expanded(
        //       child: ElevatedButton(
        //         style: ElevatedButton.styleFrom(
        //           padding: const EdgeInsets.symmetric(vertical: 12),
        //         ),
        //         onPressed: () {},
        //         child: const Text('Share Invoice'),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Invoice Items',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Table(
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
          },
          border: TableBorder.all(),
          children: [
            const TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Qty',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Amount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            ...controller.invoice.items.map((item) => TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item.description),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(item.quantity.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('\$${item.amount.toStringAsFixed(2)}'),
                ),
              ],
            )),
          ],
        ),
      ],
    );
  }

  Widget _buildTotals(InvoiceController controller) {
    return Column(
      children: [
        Table(
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(1),
          },
          children: [
            TableRow(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Subtotal'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('\$${controller.invoice.subtotal.toStringAsFixed(2)}'),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('VAT (${controller.invoice.vatPercentage}%)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('\$${controller.invoice.vatAmount.toStringAsFixed(2)}'),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Discount (${controller.invoice.discountPercentage}%)'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('-\$${controller.invoice.discountAmount.toStringAsFixed(2)}'),
                ),
              ],
            ),
          ],
        ),
        const Divider(thickness: 1),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Amount',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '\$${controller.invoice.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Information',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        _buildPaymentInfoRow('Bank Name', 'MediBank National'),
        _buildPaymentInfoRow('Account Number', '***3456'),
        _buildPaymentInfoRow('Swift Code', 'MDBNK123'),
      ],
    );
  }

  Widget _buildPaymentInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120,
            child: TextWidget(
              label,
              fontWeight: FontWeight.w700,
              fontSize: 14,
              // style: const TextStyle(
              //   fontWeight: FontWeight.bold,
              // ),
            ),
          ),
          TextWidget(value,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              // Implement download PDF functionality
            },
            icon: const Icon(Icons.download),
            label: const Text('Download PDF'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              // Implement share functionality
            },
            icon: const Icon(Icons.share),
            label: const Text('Share Invoice'),
          ),
        ),
      ],
    );
  }


  //
  Widget _buildInvoiceItem(String description, int quantity, double amount) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(description),
          Center(
            child: TextWidget(
              quantity.toString(),
              // textAlign: TextAlign.center,
            ),
          ),
          TextWidget(
            '\$${amount.toStringAsFixed(2)}',
            // textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String label, double amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label),
          ),
          Expanded(
            flex: 2,
            child: Text(
              amount >= 0
                  ? '\$${amount.toStringAsFixed(2)}'
                  : '-\$${(-amount).toStringAsFixed(2)}',
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildPaymentInfoRow(String label, String value) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 4.0),
  //     child: Row(
  //       children: [
  //         SizedBox(
  //           width: 120,
  //           child: Text(
  //             label,
  //             style: const TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //         Text(value),
  //       ],
  //     ),
  //   );
  // }

}




///


// class InvoicePage extends StatelessWidget {
//   InvoicePage({super.key});
//
//   final InvoiceController controller = Get.put(InvoiceController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text('Invoice'),
//         centerTitle: true,
//       ),
//       body: GetBuilder<InvoiceController>(
//         builder: (controller) {
//           return Container(
//             margin: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Invoice Header
//                   const Text(
//                     'Description    Qty    Amount',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//
//                   // Invoice Items
//                   _buildInvoiceItem('Consultation', 1, 150.00),
//                   _buildInvoiceItem('ECG Test', 1, 75.00),
//
//                   const Divider(thickness: 1, height: 24),
//
//                   // Totals
//                   _buildTotalRow('Subtotal', 225.00),
//                   _buildTotalRow('VAT (5%)', 11.25),
//                   _buildTotalRow('Discount (10%)', -22.50),
//
//                   const Divider(thickness: 1, height: 24),
//
//                   // Total Amount
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Total Amount',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       Text(
//                         '\$213.75',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           color: Theme.of(context).primaryColor,
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 24),
//
//                   // Payment Information
//                   const Text(
//                     'Payment Information',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   _buildPaymentInfoRow('Bank Name', 'MediBank National'),
//                   _buildPaymentInfoRow('Account Number', '****3456'),
//                   _buildPaymentInfoRow('Swift Code', 'MDBNK123'),
//
//                   const SizedBox(height: 24),
//
//                   // Action Buttons
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                             foregroundColor: Theme.of(context).primaryColor,
//                             side: BorderSide(
//                               color: Theme.of(context).primaryColor,
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                           ),
//                           onPressed: () {},
//                           child: const Text('Download PDF'),
//                         ),
//                       ),
//                       const SizedBox(width: 16),
//                       Expanded(
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                           ),
//                           onPressed: () {},
//                           child: const Text('Share Invoice'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildInvoiceItem(String description, int quantity, double amount) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: Text(description),
//           ),
//           Expanded(
//             flex: 1,
//             child: Text(
//               quantity.toString(),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Text(
//               '\$${amount.toStringAsFixed(2)}',
//               textAlign: TextAlign.right,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTotalRow(String label, double amount) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 2,
//             child: Text(label),
//           ),
//           Expanded(
//             flex: 2,
//             child: Text(
//               amount >= 0
//                   ? '\$${amount.toStringAsFixed(2)}'
//                   : '-\$${(-amount).toStringAsFixed(2)}',
//               textAlign: TextAlign.right,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPaymentInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 120,
//             child: Text(
//               label,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           Text(value),
//         ],
//       ),
//     );
//   }
// }