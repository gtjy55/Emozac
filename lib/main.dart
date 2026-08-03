import 'package:flutter/material.dart';
import 'calendar/calendarPage.dart';

void main() => runApp(Emozac());

class Emozac extends StatelessWidget {
  const Emozac({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emozac',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: CalendarPage(),
    );
  }
}


