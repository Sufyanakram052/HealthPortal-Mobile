// class Appointment {
//   final String doctorName;
//   final String specialty;
//   final String date;
//   final String time;
//   final String location;
//   final String status; // 'upcoming', 'completed', 'cancelled'
//
//   Appointment({
//     required this.doctorName,
//     required this.specialty,
//     required this.date,
//     required this.time,
//     required this.location,
//     required this.status,
//   });
// }

import '../../screens/home/appointment/appointment_screen.dart';
import '../../screens/home/appointment/appointments_controller.dart';

class Appointment {
  final String id;
  final String doctorName;
  final String specialty;
  final DateTime dateTime;
  final String location;
  final AppointmentStatus status;
  final DateTime? cancelledDate;

  Appointment({
    required this.id,
    required this.doctorName,
    required this.specialty,
    required this.dateTime,
    required this.location,
    required this.status,
    this.cancelledDate,
  });
}

// class Appointment {
//   final String id;
//   final String doctorName;
//   final String specialty;
//   final DateTime date;
//   final String time;
//   final String location;
//   final String status; // 'upcoming', 'completed', 'cancelled'
//   final String? review;
//
//   Appointment({
//     required this.id,
//     required this.doctorName,
//     required this.specialty,
//     required this.date,
//     required this.time,
//     required this.location,
//     required this.status,
//     this.review,
//   });
// }

class Review {
  final String appointmentId;
  final int rating;
  final String? comments;

  Review({
    required this.appointmentId,
    required this.rating,
    this.comments,
  });
}