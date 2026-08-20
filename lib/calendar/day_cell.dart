import 'package:flutter/material.dart';

class DayCell extends StatelessWidget {
  final int dayNumber;
  final bool isToday;
  final bool isSelected;
  final VoidCallback onTap;

  const DayCell({
    super.key,
    required this.dayNumber,
    required this.isToday,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: isSelected ? Border.all() : null,
        color: isToday ? Colors.green : Colors.transparent,
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: <Widget>[
            Text(textAlign: TextAlign.center, '$dayNumber', )
          ],
        ),       
      ),
    );
  }
}
