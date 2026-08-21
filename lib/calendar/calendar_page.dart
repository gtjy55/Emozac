import 'package:flutter/material.dart';
import 'calendar_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarState();
}

class _CalendarState extends State<CalendarPage> {
  DateTime displayDate = DateTime(2026, 8, 1);
  DateTime? selectedDate;

  void handleDaySelected(int dayNumber){
    setState(() {
      selectedDate = DateTime(displayDate.year, displayDate.month, dayNumber);
    });

    showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: 900,
        decoration: BoxDecoration(
          
        ),
        child: Column(
          children: <Widget>[

          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>setState(() {
            displayDate = DateUtils.addMonthsToMonthDate(displayDate, -1);
  }),
          icon: Icon(Icons.keyboard_arrow_left),
        ),
        title: Text('${displayDate.year}년 ${displayDate.month}월'),
        actions: <Widget>[
          IconButton(
            onPressed: ()=>setState(() {displayDate = DateUtils.addMonthsToMonthDate(displayDate, 1);}),
            icon: Icon(Icons.keyboard_arrow_right),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: CalendarWidget(showDate: displayDate, onDaySelected: handleDaySelected, selectedDate: selectedDate,)
    );
  }
}
