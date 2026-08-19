import 'package:flutter/material.dart';
import 'calendar_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarState();
}

class _CalendarState extends State<CalendarPage> {
  DateTime displayedDate = DateTime(2026, 8, 1);
  DateTime? selectedDate;

  void changeDisplayedMonth(int monthOffset) {
    setState(() {
      DateTime tempDate = DateTime(
        displayedDate.year,
        displayedDate.month + monthOffset,
        displayedDate.day,
      );
      displayedDate = tempDate;
    });
  }

  void handleDaySelected(int dayNumber){
    setState(() {
      selectedDate = DateTime(displayedDate.year, displayedDate.month, dayNumber);
    });
  }

  void goToPreviousMonth()=>changeDisplayedMonth(-1);
  void goToNextMonth() => changeDisplayedMonth(1);

  @override
  Widget build(BuildContext context) {
    int displayedYear = displayedDate.year;
    int displayedMonth = displayedDate.month;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: goToPreviousMonth,
          icon: Icon(Icons.keyboard_arrow_left),
        ),
        title: Text('$displayedYear년 $displayedMonth월'),
        actions: <Widget>[
          IconButton(
            onPressed: goToNextMonth,
            icon: Icon(Icons.keyboard_arrow_right),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: calendarWidget(showDate: displayedDate, onDaySelected: handleDaySelected,)
    );
  }
}
