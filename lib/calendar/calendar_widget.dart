import 'package:flutter/material.dart';
import 'day_cell.dart';

class calendarWidget extends StatelessWidget {
  final DateTime showDate;
  final ValueChanged<int> onDaySelected;
  final DateTime? selectedDate;

  const calendarWidget({
    super.key,
    required this.showDate,
    required this.onDaySelected,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    var today = DateTime.now();
    int firstDayOffset = DateTime(showDate.year, showDate.month, 1).weekday % 7;
    int lastDay = DateTime(showDate.year, showDate.month + 1, 0).day;
    return Container(
      decoration: BoxDecoration(
        //color: Colors.blueGrey,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(child: Center(child: Text('일'))),
              Expanded(child: Center(child: Text('월'))),
              Expanded(child: Center(child: Text('화'))),
              Expanded(child: Center(child: Text('수'))),
              Expanded(child: Center(child: Text('목'))),
              Expanded(child: Center(child: Text('금'))),
              Expanded(child: Center(child: Text('토'))),
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemCount: firstDayOffset + lastDay,
              itemBuilder: (context, index) {
                int dayNumber = index - firstDayOffset + 1;

                bool isToday =
                    (showDate.year == today.year &&
                    showDate.month == today.month &&
                    dayNumber == today.day);

                bool isSelected =
                    (selectedDate != null &&
                    selectedDate?.year == showDate.year &&
                    selectedDate?.month == showDate.month &&
                    selectedDate?.day == dayNumber);

                if (index < firstDayOffset) return Container();

                return DayCell(
                  dayNumber: dayNumber,
                  isToday: isToday,
                  isSelected: isSelected,
                  onTap: () => onDaySelected(dayNumber),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
