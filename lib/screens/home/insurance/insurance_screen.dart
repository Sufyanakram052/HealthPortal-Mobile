import 'package:get/get.dart';

import '../../../backend/models/insurance.dart';
import '../../../constants/exports.dart';
import 'edit_insurance.dart';
import 'insurance_controller.dart';

class InsuranceDetailsScreen extends StatelessWidget {
  final InsuranceController controller = Get.put(InsuranceController());

   InsuranceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.insuranceDetails,
        isTransparent: true,
        actionWidget: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () => Get.to(()=>EditInsuranceScreen()),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<InsuranceController>(
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInsuranceCard(controller.currentInsurance.value),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInsuranceCard(Insurance insurance) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divColor)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(insurance.name,fontSize: 20, fontWeight: FontWeight.w700),
                    Row(
                      children: [
                        Container(
                          height: 8,
                        width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red
                          ),
                        ),
                        5.horizontalSpace,
                        TextWidget(insurance.status,fontSize: 14, fontWeight: FontWeight.w500),
                      ],
                    ),
                  ],
                ),

                Assets.icons.insuranceBigIcon.svg(),
              ],
            ),
            SizedBox(height: 16),
            _buildDetailRow('Member ID', insurance.memberId),
            _buildDetailRow('Group Number', insurance.groupNumber),
            _buildDetailRow('Coverage Period', insurance.coveragePeriod),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}