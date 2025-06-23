//
//
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// import '../../../backend/models/appointment.dart';
//
// class AppointmentsController extends GetxController {
//   final List<Appointment> _appointments = [
//     Appointment(
//       doctorName: 'Dr. Sarah Johnson',
//       specialty: 'Cardiologist',
//       date: 'Today, March 15',
//       time: '2:30 PM',
//       location: 'Medical Center, Room 204',
//       status: 'upcoming',
//     ),
//     Appointment(
//       doctorName: 'Dr. Michael Chen',
//       specialty: 'Dermatologist',
//       date: 'Tomorrow, March 16',
//       time: '10:15 AM',
//       location: 'West Wing Clinic',
//       status: 'upcoming',
//     ),
//   ];
//
//   String selectedFilter = 'upcoming';
//   String _searchQuery = '';
//
//   List<Appointment> get filteredAppointments {
//     return _appointments.where((appointment) {
//       final matchesFilter = appointment.status == selectedFilter ||
//           selectedFilter == 'all';
//       final matchesSearch = _searchQuery.isEmpty ||
//           appointment.doctorName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
//           appointment.specialty.toLowerCase().contains(_searchQuery.toLowerCase());
//       return matchesFilter && matchesSearch;
//     }).toList();
//   }
//
//   void setFilter(String filter) {
//     selectedFilter = filter;
//     update();
//   }
//
//   void setSearchQuery(String query) {
//     _searchQuery = query;
//     update();
//   }
//
//   void attendAppointment(int index) {
//     // Implement attendance logic
//     Get.snackbar(
//       'Appointment',
//       'Attending ${filteredAppointments[index].doctorName}\'s session',
//     );
//   }
// }



import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../backend/models/appointment.dart';
import '../../../constants/exports.dart';

// class AppointmentsController extends GetxController {
//   final List<Appointment> _appointments = [
//     Appointment(
//       id: '1',
//       doctorName: 'Dr. Sarah Johnson',
//       specialty: 'Cardiologist',
//       date: DateTime.now(),
//       time: '2:30 PM',
//       location: 'Medical Center, Room 204',
//       status: 'upcoming',
//     ),
//     Appointment(
//       id: '2',
//       doctorName: 'Dr. Michael Chen',
//       specialty: 'Dermatologist',
//       date: DateTime.now().add(const Duration(days: 1)),
//       time: '10:15 AM',
//       location: 'West Wing Clinic',
//       status: 'upcoming',
//     ),
//   ];
//
//   String _selectedFilter = 'upcoming';
//   String _searchQuery = '';
//   int _selectedRating = 0;
//   String _reviewComment = '';
//
//   // Getters
//   String get selectedFilter => _selectedFilter;
//   int get selectedRating => _selectedRating;
//   String get reviewComment => _reviewComment;
//
//   List<Appointment> get filteredAppointments {
//     return _appointments.where((app) {
//       final matchesFilter = app.status == _selectedFilter;
//       final matchesSearch = _searchQuery.isEmpty ||
//           app.doctorName.toLowerCase().contains(_searchQuery.toLowerCase());
//       return matchesFilter && matchesSearch;
//     }).toList();
//   }
//
//   // Methods
//   void setFilter(String filter) {
//     _selectedFilter = filter;
//     update();
//   }
//
//   void setSearchQuery(String query) {
//     _searchQuery = query;
//     update();
//   }
//
//   void setRating(int rating) {
//     _selectedRating = rating;
//     update();
//   }
//
//   void setReviewComment(String comment) {
//     _reviewComment = comment;
//     update();
//   }
//
//   void submitReview(String appointmentId) {
//     final appointment = _appointments.firstWhere((app) => app.id == appointmentId);
//     _appointments.remove(appointment);
//     _appointments.add(appointment.copyWith(
//       status: 'completed',
//       review: _reviewComment,
//     ));
//     _selectedRating = 0;
//     _reviewComment = '';
//     update();
//     Get.back();
//   }
// }

enum AppointmentStatus { upcoming, cancelled, completed }

class AppointmentController extends GetxController {


  var selectedTab = 'Upcoming';
  DateTime? selectedDateTime;
  final dateController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary, // Header color
              onPrimary: AppColors.whiteColor,// Header text color
              onSurface: AppColors.primary, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDateTime) {
      selectedDateTime = picked;
      update();
      dateController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  void changeTab(String tab) {
    selectedTab = tab;
    update();
  }
}