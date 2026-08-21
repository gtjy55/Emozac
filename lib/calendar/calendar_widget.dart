import 'package:flutter/material.dart';
import 'day_cell.dart';

class CalendarWidget extends StatelessWidget {
  final DateTime displayDate;
  final ValueChanged<int> onDaySelected;
  final DateTime? selectedDate;

  const CalendarWidget({
    super.key,
    required this.displayDate,
    required this.onDaySelected,
    required this.selectedDate,
  });

  final List weekdayNames = const ['일', '월', '화', '수', '목', '금', '토'];

  @override
  Widget build(BuildContext context) {
    var today = DateTime.now();
    int firstDayOffset = DateUtils.firstDayOffset(displayDate.year, displayDate.month,MaterialLocalizations.of(context));
    int lastDay = DateUtils.getDaysInMonth(displayDate.year, displayDate.month);

    
    return Container(
      decoration: BoxDecoration(
        //color: Colors.blueGrey,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: List.generate(weekdayNames.length, (index) {
              return Expanded(
                child: Text(weekdayNames[index], textAlign: TextAlign.center),
              );
            }),
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
                    (displayDate.year == today.year &&
                    displayDate.month == today.month &&
                    dayNumber == today.day);

                bool isSelected =
                    (selectedDate != null &&
                    selectedDate?.year == displayDate.year &&
                    selectedDate?.month == displayDate.month &&
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
