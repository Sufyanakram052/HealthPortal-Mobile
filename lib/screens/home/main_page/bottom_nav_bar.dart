import 'package:get/get.dart';
import 'package:htca_app/backend/models/appointment.dart';
import 'package:htca_app/constants/exports.dart';

import '../appointment/appointment_screen.dart';
import '../appointment/doctor_appointment/find_doctor_screen.dart';
import '../dependent/dependent_screen.dart';
import '../home_page/home_screen.dart';
import '../profile/profile_screen.dart';
import '../records/records_screen.dart';
import 'bottom_nav_controller.dart';



class BottomNavBar extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  final List<Widget> _screens = [
    HomeScreen(),
    FindDoctorPage(),
    //UpcomingAppointments(),
    const RecordsScreen(),
    DependentsScreen(),
    const ProfileScreen(),
  ];

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: _screens[navController.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navController.selectedIndex.value,
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black87,
        onTap: navController.changeTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label:AppStrings.appointments,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file),
            label: AppStrings.records,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.family_restroom),
            label: AppStrings.dependents,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppStrings.profile,
          ),
        ],
      ),
    ));
  }
}

