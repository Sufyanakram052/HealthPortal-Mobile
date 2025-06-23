import 'package:get/get.dart';

import '../../../../constants/exports.dart';
import 'doctor_appointment_controller.dart';

class FindDoctorPage extends StatelessWidget {
  final DoctorController controller = Get.put(DoctorController());

  FindDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackIcon: true,
        title: AppStrings.findYouDoctor,
        isTransparent: true,
        // height: 30,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                prefixIcon: Icon(Icons.search,color: AppColors.primaryTextColor,),
                  borderColor: AppColors.divColor,
                  hintText: AppStrings.searchByDoctorNameOrSpecialty),
              const SizedBox(height: 16),
              const TextWidget(AppStrings.availableDoctors, fontWeight: FontWeight.bold),
              const SizedBox(height: 12),
              GetBuilder<DoctorController>(
                init: DoctorController(),
                builder: (controller) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _departmentChip('All Departments'),
                      _departmentChip('Cardiology'),
                      _departmentChip('Neurology'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GetBuilder<DoctorController>(
                  init: DoctorController(),
                  builder: (_) => ListView.builder(
                    itemCount: controller.doctors.length,
                    itemBuilder: (_, index) {
                      final doctor = controller.doctors[index];
                      return DoctorCard(doctor: doctor);
                    },
                  ),
                ),
              ),
              CustomButton(title: AppStrings.bookAppointment, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _departmentChip(String label) {
    var isSelected = controller.selectedDepartment == label;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        shape: StadiumBorder(side: BorderSide(color: AppColors.cardColor)),
        label: Text(label),
        selected: isSelected,
        showCheckmark: false,
        backgroundColor: AppColors.cardColor,
        onSelected: (_) => controller.changeDepartment(label),
        selectedColor: AppColors.primary,
        disabledColor: AppColors.cardColor,
        labelStyle: TextStyle(color: isSelected ? Colors.white : AppColors.primaryTextColor),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Map<String, String> doctor;

  DoctorCard({super.key, required this.doctor});
  final DoctorController controller = Get.put(DoctorController());


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divColor),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(doctor['image']!),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(doctor['specialty']!),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.blue, size: 16),
                    const SizedBox(width: 4),
                    Text(doctor['rating']!),
                    const SizedBox(width: 10),
                    Text(doctor['experience']!),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextWidget(doctor['price']!),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 124.w,
                    child: CustomButton(
                      title: AppStrings.bookNow,
                      onPressed: controller.onBookDoctor,
                      height: 36.h,
                      //fontSize: 12,
                      // padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

