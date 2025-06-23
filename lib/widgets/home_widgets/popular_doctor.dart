import '../../backend/models/doctor.dart';
import '../../constants/exports.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 184,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 64.h,
            width: 64.w,
            decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red),
          ),
          12.verticalSpace,
          TextWidget(
            doctor.name,
            // style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            // ),
          ),
          5.verticalSpace,
          TextWidget(
            doctor.specialty,
            // style: TextStyle(
            fontSize: 14,
            color: AppColors.secFontColor,
            // ),
          ),
          5.verticalSpace,
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16),
              SizedBox(width: 4),
              TextWidget(
                doctor.rating.toString(),

                fontSize: 14,
                fontWeight: FontWeight.bold,

              ),
              Spacer(),
              TextWidget(
                '${doctor.experience} years',
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ],
          ),
        ],
      ),
    );
  }
}