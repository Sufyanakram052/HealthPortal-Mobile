
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// import '../../../backend/models/appointment.dart';
// import 'appointments_controller.dart';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// class AppointmentsScreen extends StatelessWidget {
//   final AppointmentController controller = Get.put(AppointmentController());
//
//    AppointmentsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Appointments'),
//       ),
//       body: Column(
//         children: [
//           _buildSearchAndFilterSection(),
//           _buildStatusTabs(),
//           Expanded(child: _buildAppointmentsList()),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSearchAndFilterSection() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           TextField(
//             onChanged: (value) => controller.setSearchQuery(value),
//             decoration: InputDecoration(
//               hintText: 'Search appointments',
//               prefixIcon: Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           InkWell(
//             onTap: () => controller.selectDate(Get.context!),
//             child: GetBuilder<AppointmentController>(
//               init: AppointmentController(),
//               builder: (controller) => InputDecorator(
//                 decoration: InputDecoration(
//                   hintText: 'Select Date',
//                   prefixIcon: Icon(Icons.calendar_today),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//                 child: Text(
//                   controller.selectedDate.value == null
//                       ? ''
//                       : DateFormat('MMM d, yyyy')
//                       .format(controller.selectedDate.value!),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatusTabs() {
//     return GetBuilder<AppointmentController>(
//       init: AppointmentController(),
//       builder: (controller) => Container(
//         height: 50,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: 3,
//           itemBuilder: (context, index) {
//             final tabs = ['Upcoming', 'Cancelled', 'Completed'];
//             return GestureDetector(
//               onTap: () => controller.changeTab(index),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 margin: EdgeInsets.symmetric(horizontal: 4),
//                 decoration: BoxDecoration(
//                   color: controller.currentTabIndex.value == index
//                       ? Colors.blue
//                       : Colors.grey[200],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Center(
//                   child: Text(
//                     tabs[index],
//                     style: TextStyle(
//                       color: controller.currentTabIndex.value == index
//                           ? Colors.white
//                           : Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAppointmentsList() {
//     return GetBuilder<AppointmentController>(
//       init: AppointmentController(),
//       builder: (controller) {
//         if (controller.filteredAppointments.isEmpty) {
//           return Center(child: Text('No appointments found'));
//         }
//
//         return ListView.builder(
//           itemCount: controller.filteredAppointments.length,
//           itemBuilder: (context, index) {
//             final appointment = controller.filteredAppointments[index];
//             return AppointmentCard(appointment: appointment);
//           },
//         );
//       },
//     );
//   }
// }
//
// class AppointmentCard extends StatelessWidget {
//   final Appointment appointment;
//
//   const AppointmentCard({Key? key, required this.appointment}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               appointment.doctorName,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               appointment.specialty,
//               style: TextStyle(color: Colors.grey),
//             ),
//             SizedBox(height: 10),
//             Text(
//               _formatDateTime(appointment.dateTime),
//               style: TextStyle(fontSize: 16),
//             ),
//             Text(appointment.location),
//             if (appointment.status == AppointmentStatus.cancelled &&
//                 appointment.cancelledDate != null)
//               Text(
//                 'Cancelled on ${_formatDate(appointment.cancelledDate!)}',
//                 style: TextStyle(color: Colors.red),
//               ),
//             SizedBox(height: 10),
//             _buildActionButton(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildActionButton() {
//     switch (appointment.status) {
//       case AppointmentStatus.upcoming:
//         return ElevatedButton(
//           onPressed: () => print('Attending appointment'),
//           child: Text('Attend'),
//         );
//       case AppointmentStatus.completed:
//         return ElevatedButton(
//           onPressed: () => Get.to(() => ReviewScreen(appointment: appointment)),
//           child: Text('Add Review'),
//         );
//       default:
//         return SizedBox.shrink();
//     }
//   }
//
//   String _formatDateTime(DateTime dateTime) {
//     return DateFormat('MMMM d, y • h:mm a').format(dateTime);
//   }
//
//   String _formatDate(DateTime date) {
//     return DateFormat('MMMM d, y').format(date);
//   }
// }
//
// class ReviewScreen extends StatefulWidget {
//   final Appointment appointment;
//
//   const ReviewScreen({Key? key, required this.appointment}) : super(key: key);
//
//   @override
//   _ReviewScreenState createState() => _ReviewScreenState();
// }
//
// class _ReviewScreenState extends State<ReviewScreen> {
//   final TextEditingController _commentController = TextEditingController();
//   int _rating = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Rate Your Experience'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.appointment.doctorName,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               widget.appointment.specialty,
//               style: TextStyle(color: Colors.grey),
//             ),
//             Text(
//               DateFormat('MMMM d, yyyy - h:mm a').format(widget.appointment.dateTime),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'How was your experience?',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(5, (index) {
//                 return IconButton(
//                   icon: Icon(
//                     index < _rating ? Icons.star : Icons.star_border,
//                     color: Colors.amber,
//                     size: 40,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _rating = index + 1;
//                     });
//                   },
//                 );
//               }),
//             ),
//             SizedBox(height: 20),
//             Text(
//                 'Share your experience with Dr. ${widget.appointment.doctorName.split(' ').last} (optional)'),
//             SizedBox(height: 10),
//             TextField(
//               controller: _commentController,
//               maxLines: 5,
//               maxLength: 500,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Write your review here...',
//                 counterText: '${_commentController.text.length}/500',
//               ),
//               onChanged: (text) {
//                 setState(() {});
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _submitReview,
//               child: Text('Submit Review'),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _submitReview() {
//     if (_rating == 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please select a rating')),
//       );
//       return;
//     }
//
//     Navigator.pop(context);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Review submitted successfully')),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';
import 'package:htca_app/constants/exports.dart';
import 'package:htca_app/screens/home/appointment/review_screen/review_screen.dart';

import 'appointments_controller.dart';


class UpcomingAppointments extends StatelessWidget {

  final AppointmentController controller = Get.put(AppointmentController());

  UpcomingAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.myAppointments,
        isTransparent: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomTextField(
              prefixIcon: const Icon(Icons.search),
              borderColor: AppColors.divColor,
              hintText: AppStrings.searchAppointments,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () => controller.selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.divColor),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, size: 20, color: Colors.grey.shade600),
                    10.horizontalSpace,
                    TextWidget(
                      controller.selectedDateTime == null
                          ? 'DD/MM/YYYY'
                          : "${controller.selectedDateTime!.day}/${controller.selectedDateTime!.month}/${controller.selectedDateTime!.year}",
                      fontSize: 16,
                      color: controller.selectedDateTime == null
                          ? Colors.grey.shade600
                          : Colors.black,
                    ),


                  ],
                ),
              ),
            ),
          ),


          // const SizedBox(height: 10),
          // 5.verticalSpace,
          GetBuilder<AppointmentController>(
            builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tabButton('Upcoming', controller),
                _tabButton('Cancelled', controller),
                _tabButton('Completed', controller),
              ],
            ),
          ),

          const SizedBox(height: 10),
          Expanded(
            child: GetBuilder<AppointmentController>(
              init: AppointmentController(),
              builder: (_) {
                final tab = controller.selectedTab;
                return ListView(
                  padding: const EdgeInsets.all(12),
                  children: [
                    if (tab == 'Upcoming')
                      AppointmentCard(
                        doctorName: 'Dr. Sarah Johnson',
                        specialty: 'Cardiologist',
                        date: 'Today, March 15',
                        time: '2:30 PM',
                        location: 'Medical Center, Room 204',
                        actionLabel: 'Attend',
                        onAction: (){},
                      ),
                    if (tab == 'Upcoming')
                      AppointmentCard(
                        doctorName: 'Dr. Michael Chen',
                        specialty: 'Dermatologist',
                        date: 'Tomorrow, March 16',
                        time: '10:15 AM',
                        location: 'West Wing Clinic',
                        actionLabel: 'Attend',
                        onAction: (){},
                      ),
                    if (tab == 'Cancelled')
                      AppointmentCard(
                        doctorName: 'Dr. Sarah Johnson',
                        specialty: 'Cardiologist',
                        date: 'Today, March 15',
                        time: '2:30 PM',
                        location: 'Medical Center, Room 204',
                        status: 'Cancelled',
                        onAction: (){},
                      ),
                    if (tab == 'Cancelled')
                      AppointmentCard(
                        doctorName: 'Dr. Michael Chen',
                        specialty: 'Dermatologist',
                        date: 'Tomorrow, March 16',
                        time: '10:15 AM',
                        location: 'West Wing Clinic',
                        status: 'Cancelled',
                        onAction: (){},
                      ),
                    if (tab == 'Completed')
                      AppointmentCard(
                        doctorName: 'Dr. Sarah Johnson',
                        specialty: 'Cardiologist',
                        date: 'Today, March 15',
                        time: '2:30 PM',
                        location: 'Medical Center, Room 204',
                        status: 'Completed',
                        actionLabel: 'Add Review',
                        onAction: () => Get.to(() => ReviewPage()),
                      ),
                    if (tab == 'Completed')
                      AppointmentCard(
                        doctorName: 'Dr. Michael Chen',
                        specialty: 'Dermatologist',
                        date: 'Tomorrow, March 16',
                        time: '10:15 AM',
                        location: 'West Wing Clinic',
                        status: 'Completed',
                        actionLabel: 'Add Review',
                        onAction: () => Get.to(() => ReviewPage()),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }




  Widget _tabButton(String label, AppointmentController controller) {
    final isSelected = controller.selectedTab == label;
    return ElevatedButton(
      onPressed: () => controller.changeTab(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // 12 border radius
        ),
      ),
      child: Text(label),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String doctorName, specialty, date, time, location;
  final String? status, actionLabel;
  final VoidCallback? onAction;

  const AppointmentCard({super.key,
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
    required this.location,
    this.status,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(doctorName,fontWeight: FontWeight.bold),
                  if (status != null)
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: status == 'Completed'
                              ? Colors.green[100]
                              : status == 'Cancelled'
                              ? Colors.red[100]
                              : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(status!, style: const TextStyle(color: Colors.black)),
                      ),
                    ),
                ],
              ),
              TextWidget(specialty),
              8.verticalSpace,
              Row(children: [ const Icon(Icons.calendar_today, size: 16,color: AppColors.primaryTextColor,), 8.horizontalSpace, Text(date)]),
              8.verticalSpace,
              Row(children: [ const Icon(Icons.access_time, size: 16,color: AppColors.primaryTextColor,),8.horizontalSpace, Text(time)]),
              8.verticalSpace,
              Row(children: [ const Icon(Icons.location_on, size: 16,color: AppColors.primaryTextColor,), 8.horizontalSpace, Text(location)]),
              8.verticalSpace,
              if (actionLabel != null)
                CustomButton(
                  title: actionLabel!,
                  onPressed: onAction,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

