// // calendar_widget.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../screens/home/appointment/book_doctor/book_doctor_controller.dart';
//
// class BookingCalendar extends StatelessWidget {
//   final BookDoctorController controller = Get.put(BookDoctorController());
//
//    BookingCalendar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BookDoctorController>(
//       init: BookDoctorController(),
//       builder: (_) {
//         final daysInMonth = DateUtils.getDaysInMonth(
//             controller.currentMonth.value.year,
//             controller.currentMonth.value.month
//         );
//         final firstDay = DateTime(
//             controller.currentMonth.value.year,
//             controller.currentMonth.value.month,
//             1
//         );
//         final startingWeekday = firstDay.weekday % 7;
//
//         return Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.chevron_left),
//                   onPressed: controller.prevMonth,
//                 ),
//                 Text(controller.getMonthYear()),
//                 IconButton(
//                   icon: Icon(Icons.chevron_right),
//                   onPressed: controller.nextMonth,
//                 ),
//               ],
//             ),
//             GridView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 7,
//                 childAspectRatio: 1,
//               ),
//               itemCount: startingWeekday + daysInMonth,
//               itemBuilder: (context, index) {
//                 if (index < startingWeekday) return SizedBox();
//
//                 final day = index - startingWeekday + 1;
//                 final date = DateTime(
//                     controller.currentMonth.value.year,
//                     controller.currentMonth.value.month,
//                     day
//                 );
//
//                 return GestureDetector(
//                   onTap: () => controller.selectDate(date),
//                   child: Container(
//                     margin: EdgeInsets.all(4),
//                     decoration: BoxDecoration(
//                       color: controller.isSelected(date)
//                           ? Colors.blue
//                           : Colors.transparent,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text('$day', style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: controller.isSelected(date)
//                               ? Colors.white
//                               : Colors.black,
//                         )),
//                         Text(controller.getDayName(date), style: TextStyle(
//                           fontSize: 12,
//                           color: controller.isSelected(date)
//                               ? Colors.white
//                               : Colors.grey,
//                         )),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:htca_app/constants/colors.dart';
import 'package:htca_app/constants/exports.dart';
import 'package:intl/intl.dart';

class HorizontalWeekCalendar extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final Locale? locale;
  final bool rtl; // Right-to-left support

  const HorizontalWeekCalendar({
    super.key,
    required this.onDateSelected,
    this.locale,
    this.rtl = false,
  });

  @override
  _HorizontalWeekCalendarState createState() => _HorizontalWeekCalendarState();
}

class _HorizontalWeekCalendarState extends State<HorizontalWeekCalendar> {
  late DateTime _selectedDate;
  late DateTime _currentWeekStart;
  final ScrollController _scrollController = ScrollController();
  final double _dayWidth = 60.0;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _currentWeekStart = _getWeekStart(_selectedDate);
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToDate(_selectedDate));
  }

  DateTime _getWeekStart(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  void _scrollToDate(DateTime date) {
    final weeksBetween = date.difference(_getWeekStart(DateTime.now())).inDays ~/ 7;
    final offset = weeksBetween * _dayWidth * 7;
    _scrollController.animateTo(
      widget.rtl ? -offset : offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  List<DateTime> _generateWeekDays(DateTime weekStart) {
    return List.generate(7, (index) => weekStart.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final weekStart = _getWeekStart(DateTime.now()).add(Duration(days: (index - 50) * 7));
          final weekDays = _generateWeekDays(weekStart);

          return SizedBox(
            width: _dayWidth * 7,
            child: Row(
              children: weekDays.map((date) {
                final isSelected = date.day == _selectedDate.day &&
                    date.month == _selectedDate.month &&
                    date.year == _selectedDate.year;
                final isToday = date.day == DateTime.now().day &&
                    date.month == DateTime.now().month &&
                    date.year == DateTime.now().year;

                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedDate = date);
                    widget.onDateSelected(date);
                  },
                  child: Container(
                    width: _dayWidth,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      // color:  context.primary ,
                      color: isSelected ? context.primary : null,
                      borderRadius: BorderRadius.circular(8),
                      border: isToday && !isSelected
                          ? Border.all(color: Theme.of(context).primaryColor)
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('E', widget.locale?.languageCode).format(date)[0],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${date.day}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}