import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarState();
}

class _CalendarState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    // today
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;
    int currentDay = DateTime.now().day;

    int displayedYear = currentYear;
    int displayedMonth = currentMonth;
    int displayedDay = currentDay;

    int padding = DateTime(displayedYear, displayedMonth, 1).weekday % 7;
    int daysInMonth = DateTime(displayedYear, displayedMonth + 1, 0).day;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            displayedMonth--;
          },
          icon: Icon(Icons.keyboard_arrow_left),
        ),
        title: Text('$displayedMonth 월'),
        actions: [
          IconButton(
            onPressed: () {
              displayedMonth++;
            },
            icon: Icon(Icons.keyboard_arrow_right),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),

      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text('일')),
              Expanded(child: Text('월')),
              Expanded(child: Text('화')),
              Expanded(child: Text('수')),
              Expanded(child: Text('목')),
              Expanded(child: Text('금')),
              Expanded(child: Text('토')),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: padding + daysInMonth,
              itemBuilder: (context, index) {
                int actualDay = index - padding + 1;

                if (index < padding) return Container();

                return Text('$actualDay');
              },
            ),
          ),
        ],
      ),
    );
  }
}
