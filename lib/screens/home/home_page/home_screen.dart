import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:htca_app/constants/exports.dart';

import '../../../backend/models/doctor.dart';
import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../gen/assets.gen.dart';
import '../../../widgets/common/text_widget.dart';
import '../../../widgets/home_widgets/family_Card.dart';
import '../../../widgets/home_widgets/health_card.dart';
import '../../../widgets/home_widgets/popular_doctor.dart';
import '../../auth/login/login_controller.dart';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../menu/menu_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});


  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. John Smith',
      specialty: 'Neurologist',
      rating: 4.9,
      experience: 15,
    ),
    Doctor(
      name: 'Dr. Emily Brown',
      specialty: 'Cardiologist',
      rating: 4.8,
      experience: 12,
    ),
    Doctor(
      name: 'Dr. Michael Johnson',
      specialty: 'Pediatrician',
      rating: 4.7,
      experience: 10,
    ),
    Doctor(
      name: 'Dr. Sarah Wilson',
      specialty: 'Dermatologist',
      rating: 4.9,
      experience: 8,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Get.put(LoginController()).scaffoldKey,//<LoginController>().scaffoldKey,
      // key: GlobalKey<ScaffoldState>(debugLabel: 'mainScaffold'),
      // appBar: AppBar(),
      drawer: CustomMainDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: 0.95.sh,
            padding: const EdgeInsets.all(20).r,
            child: GetBuilder<LoginController>(
              init: LoginController(),
              builder: (controller) {
                return Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    onCreateTopBuilder(controller),
                    20.verticalSpace,
                    heathCardDetails(),
                    20.verticalSpace,
                    onQuickActionBuild(),
                    20.verticalSpace,
                    onUpComingAppointment(),
                    20.verticalSpace,
                    onHeartRate(),
                    onPopDoc(),
                    onFamilyCardWidget(),
                    onMedicalRecord(),


                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget onCreateTopBuilder(LoginController controller){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(AppStrings.healthTech,fontSize: 24,fontWeight: FontWeight.w600,),
            TextWidget("${AppStrings.welcomeBack}, John",fontSize: 14),
          ],
        ),
        // Spacer(),
        Row(
          children: [
            Assets.icons.bellIocn.svg(),
            10.horizontalSpace,
            InkWell(
              onTap: (){
                controller.scaffoldKey.currentState?.openDrawer();
                controller.openCDrawer();
                log('open the drawer from here');
              },
              child: Icon(Icons.menu,color: AppColors.primaryTextColor,),
            )
          ],
        ),
      ],
    );
  }

  Widget heathCardDetails(){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        onFitnessMeasureCard(icon: Assets.icons.heart.svg(), result: '140', accurateResult: '60-80', topResult: 'Elevated',isBp: true),
        10.horizontalSpace,
        onFitnessMeasureCard(icon: Assets.icons.heart.svg(), result: '37.7', accurateResult: '122', topResult: 'Normal'),
      ],
    );
  }

  Widget onFitnessMeasureCard({
    required Widget icon,
    required String result,
    required String accurateResult,
    required String topResult,
    bool isBp = false,
  }){
    return Expanded(
      child: Container(
        height: 116.h,
        // width: 167.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.divColor),
          // color: Colors.red
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 12,right: 8),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  icon,
                  // Spacer(),
                  Container(
                    height: 24.h,
                    width: 62.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.cardColor),
                      color: AppColors.cardColor
                    ),
                    child: Center(child: TextWidget(topResult,color: AppColors.primaryTextColor,fontSize: 12,)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  TextWidget(result,fontSize: 24,fontWeight: FontWeight.bold,color: AppColors.primaryTextColor),
                  7.horizontalSpace,
                  isBp?TextWidget(AppStrings.bpm,):
                      Assets.icons.degreeCenti.svg()

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextWidget(AppStrings.normal),
                  3.horizontalSpace,
                  TextWidget(accurateResult),
                  3.horizontalSpace,
                  isBp?TextWidget(AppStrings.bpm):
                  Assets.icons.degreeCenti.svg()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget onQuickActionBuild(){
    return Container(
      height: 170.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.cardColor),
        color: AppColors.cardColor
      ),
      child: Padding(
        padding: const EdgeInsets.all( 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(AppStrings.quickAction,fontSize: 18,color: AppColors.darkFont,),
            ),
            Row(
              children: [
                onQuickActionCard(icon: Assets.icons.calenderIcon.svg(height: 24,width: 24),title: AppStrings.bookAppointment),
                onQuickActionCard(icon: Assets.icons.recordFolder.svg(height: 24,width: 24),title: AppStrings.medicalRecords),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget onQuickActionCard({required Widget icon,required String title}){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 88.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            color: AppColors.primary
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              10.verticalSpace,
              TextWidget(title,fontSize: 14,fontWeight: FontWeight.normal,color: AppColors.whiteColor,)

            ],
          ),
        ),
      ),
    );
  }

  Widget onUpComingAppointment(){
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(AppStrings.upcomingAppointments),
            TextWidget(AppStrings.viewAll,onTap: (){},color: AppColors.darkFont,fontSize: 14,)
          ],
        ),
        15.verticalSpace,
        Container(
          height: 175.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.divColor)
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(

                      children: [
                        Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.cardColor),
                            color: Colors.red
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0,left: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget('Dr. Sarah Wilson',),
                        3.verticalSpace,
                        TextWidget('Cardiologist',color: AppColors.primary,),
                        3.verticalSpace,
                        Row(
                          children: [
                            Assets.icons.watchIcon.svg(),
                            5.horizontalSpace,
                            TextWidget('Today, 2:30 PM',fontSize: 14,),
                          ],
                        ),
                        3.verticalSpace,
                        Row(
                          children: [
                            Assets.icons.plusMedicle.svg(),
                            5.horizontalSpace,
                            TextWidget('Medical Center, Floor 3',fontSize: 14,),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              10.verticalSpace,
              Divider(endIndent: 20,indent: 20,color: AppColors.divColor,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20,top: 8),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(AppStrings.confirm),
                    Assets.icons.arrowForward.svg(),
                  ],
                ),
              ),
            ],
          ),
        ),
        20.verticalSpace,
        Container(
          height: 126.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.divColor)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(AppStrings.yourHealthScore,fontSize: 18,),
                        3.verticalSpace,
                        TextWidget('95%',fontSize: 30,fontWeight: FontWeight.bold,),
                        3.verticalSpace,
                        TextWidget(AppStrings.excellentCondition,fontSize: 14,),
                      ],
                    ),
                  )
                ],
              ),
              // Spacer(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: PieChart(
                    PieChartData(
                      startDegreeOffset: -100,
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: [
                        PieChartSectionData(
                          color: Colors.blue,
                          value: 56,
                          showTitle: false,
                          radius: 10,
                        ),
                        PieChartSectionData(
                          color: Colors.grey[300],
                          value: 100 - 90,
                          showTitle: false,
                          radius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget onHeartRate(){
    return HeartRateSectionWithFilter();
  }

   Widget onPopDoc() {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         12.verticalSpace,
         TextWidget(
           AppStrings.popularDoctors,
           fontSize: 18,
         ),
         Container(
           height: 180.h, // fixed height for horizontal scrolling
           child: ListView.builder(
             scrollDirection: Axis.horizontal,
             itemCount: doctors.length,
             itemBuilder: (context, index) {
               return DoctorCard(doctor: doctors[index]);
             },
           ),
         ),
       ],
     );
   }

  Widget onFamilyCardWidget(){
    return   Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        12.verticalSpace,
        TextWidget(AppStrings.familyMembers,
          fontSize: 18,
        ),
        Container(
          height: 180, // Fixed height for the horizontal list
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: FamilyCardWidget(),
              );
            },
          ),
        ),
      ],
    );
  }


  Widget onMedicalRecord(){
    return   Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        12.verticalSpace,
        TextWidget(AppStrings.recentMedicalRecords,
          fontSize: 18,
        ),
        // Container(
        //   height: 180, // Fixed height for the horizontal list
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: doctors.length,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: FamilyCardWidget(),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }



}



// class HeartRateSectionWithChart extends StatelessWidget {
//   final List<double> heartRateData = [72, 75, 80, 78, 76, 74, 72];
//
//    HeartRateSectionWithChart({super.key}); // Sample data
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 2,
//             blurRadius: 8,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Health Analytics',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 16),
//           Text(
//             'Heart Rate',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 8),
//           Row(
//             children: [
//               Text(
//                 'Today',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey[600],
//                 ),
//               ),
//               SizedBox(width: 4),
//               Icon(
//                 Icons.check_circle,
//                 color: Colors.green,
//                 size: 16,
//               ),
//               SizedBox(width: 8),
//               Text(
//                 '72 BPM',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue[800],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 16),
//           Container(
//             height: 150,
//             child: LineChart(
//               LineChartData(
//                 gridData: FlGridData(show: false),
//                 titlesData: FlTitlesData(show: false),
//                 borderData: FlBorderData(show: false),
//                 minX: 0,
//                 maxX: heartRateData.length.toDouble() - 1,
//                 minY: 60,
//                 maxY: 90,
//                 lineBarsData: [
//                   LineChartBarData(
//                     spots: heartRateData.asMap().entries.map((entry) {
//                       return FlSpot(entry.key.toDouble(), entry.value);
//                     }).toList(),
//                     isCurved: true,
//                     color: Colors.blue,
//                     barWidth: 3,
//                     isStrokeCapRound: true,
//                     dotData: FlDotData(show: false),
//                     belowBarData: BarAreaData(
//                       show: true,
//                       color: Colors.blue.withOpacity(0.1),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


