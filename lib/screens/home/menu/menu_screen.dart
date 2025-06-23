import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htca_app/constants/exports.dart';
import 'package:htca_app/screens/auth/login/login_screen.dart';
import 'package:htca_app/screens/home/appointment/appointment_booked/appointment_booked.dart';
import 'package:htca_app/screens/home/appointment/doctor_appointment/find_doctor_screen.dart';
import 'package:htca_app/screens/home/profile/profile_screen.dart';
import '../appointment/appointment_screen.dart';
import '../insurance/insurance_screen.dart';
import 'menu_controller.dart';

class CustomMainDrawer extends StatelessWidget {
 final MainMenuController controller = Get.put(MainMenuController());

  CustomMainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.menu,
        isTransparent: true,
      ),
      body: Drawer(

        width: 550,
        backgroundColor: AppColors.whiteColor,
        child: Column(
          children: [
            _buildMenuHeaderItem(),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.menuItems.length,
                itemBuilder: (context, index) {
                  var item = controller.menuItems[index];

                  if (item['isHeader'] == true) {
                    return _buildHeader(item['title'].toString());
                  } else {
                    return _buildMenuItem(
                      item['title'].toString(),
                      item['icon'] as SvgPicture?,
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                prefixIcon: Assets.icons.logout.svg(),
                title: AppStrings.signOut,
                onPressed: (){
                  Get.offAll(()=>Login());
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: TextWidget(
        title,
        // style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryTextColor,
        // ),
      ),
    );
  }

  Widget _buildMenuHeaderItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Get.to(() => ProfileScreen());
        },
        child: Container(
          height: 110.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.cardColor
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 64,
                  width: 77,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red
                  ),
                ),
                8.horizontalSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget('John Smith',fontSize: 18,fontWeight: FontWeight.w700,),
                    TextWidget('john.smith@email.com',fontSize: 14,fontWeight: FontWeight.w500,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, SvgPicture? icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.cardColor
        ),
        child: ListTile(
          leading: icon,
          title: TextWidget(
            title,
              fontSize: 16,
            color: AppColors.primaryTextColor,
          ),
          trailing: Icon(Icons.arrow_forward_ios,size: 16,color: AppColors.primaryTextColor,),
          onTap: () => _handleTap(title),
        ),
      ),
    );
  }

  void _handleTap(String title) {
    if (title == 'Sign Out') {
      // Handle sign out
      Get.offAllNamed('/login');
    }
    else if (title == 'Find Doctor') {
      // Handle sign out
      // From anywhere in your app:
      Get.to(() => FindDoctorPage());
    } else if (title == 'Appointments') {
      // Handle sign out
      // From anywhere in your app:
      Get.to(() => UpcomingAppointments());
    } else if (title == 'Book New Appointment') {
      // Handle sign out
      // From anywhere in your app:
      Get.to(() => FindDoctorPage());
    } else if (title == 'Insurance') {
      // Handle sign out
      // From anywhere in your app:
      Get.to(() => InsuranceDetailsScreen());
    }else if (title == 'My Profile') {
      // Handle sign out
      // From anywhere in your app:
      Get.to(() => ProfileScreen());
    }else if (title == 'Insurance') {
      // Handle sign out
      // From anywhere in your app:
      Get.to(() => InsuranceDetailsScreen());
    } else {
      // Handle other taps
      Get.back(); // Close drawer
      Get.snackbar('Selected', title);
    }
  }
}