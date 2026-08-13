import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarState();
}

class _CalendarState extends State<CalendarPage> {
  var today = DateTime.now();

  int displayedYear = 2026;
  int displayedMonth = 8;
  int displayedDay = 1;

  void changeMonth(int direction) {
    setState(() {
      DateTime tempDate = DateTime(
        displayedYear,
        displayedMonth + direction,
        displayedDay,
      );
      displayedYear = tempDate.year;
      displayedMonth = tempDate.month;
      displayedDay = tempDate.day;
    });
  }

  void previousMonth() => changeMonth(-1);
  void nextMonth() => changeMonth(1);

  @override
  Widget build(BuildContext context) {
    int padding = DateTime(displayedYear, displayedMonth, 1).weekday % 7;
    int daysInMonth = DateTime(displayedYear, displayedMonth + 1, 0).day;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: previousMonth,
          icon: Icon(Icons.keyboard_arrow_left),
        ),
        title: Text('$displayedYear년 $displayedMonth월'),
        actions: [
          IconButton(
            onPressed: nextMonth,
            icon: Icon(Icons.keyboard_arrow_right),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: Column(         
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

                  

                  return Container(
                    decoration: BoxDecoration(),
                    child: Text('$actualDay'),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
