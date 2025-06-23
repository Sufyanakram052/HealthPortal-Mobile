import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:htca_app/constants/exports.dart';

class MainMenuController extends GetxController {
  final menuItems = [
    // {'title': 'Menu', 'isHeader': true},
    // {'title': 'John Smith'},
    // {'title': 'john.smith@email.co...'},
    {'title': 'Features & Services', 'isHeader': true},
    {'title': 'Find Doctor', 'icon': Assets.icons.findDrIcon.svg()},
    {'title': 'Appointments', 'icon': Assets.icons.appointmrntIcon.svg()},
    {'title': 'Book New Appointment', 'icon': Assets.icons.bookNewAppIcon.svg()},
    {'title': 'Insurance', 'icon': Assets.icons.insuranceIcon.svg()},
    {'title': 'Help Center', 'icon': Assets.icons.helpIcon.svg()},
    {'title': 'About Us', 'icon': Assets.icons.aboutUsIcon.svg()},
    {'title': 'Account & Settings', 'isHeader': true},
    {'title': 'My Profile', 'icon': Assets.icons.peopleIcon.svg()},
    {'title': 'Payment Methods', 'icon': Assets.icons.card.svg()},
   // {'title': 'Sign Out', 'icon': Assets.icons.logout.svg()},
  ];
}