import 'package:flutter/material.dart';

void main() => runApp(Emozac());

class Emozac extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emozac',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    int _currentYear = DateTime.now().year;
    int _currentMonth = DateTime.now().month;

    int padding = DateTime(_currentYear, _currentMonth, 1).weekday % 7;
    int daysInMonth = DateTime(_currentYear, _currentMonth + 1, 0).day;
    return Scaffold(
      appBar: AppBar(
        title: Text('$_currentMonth 월'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          ),
        itemCount: 42,
        itemBuilder: (context, index) {
          int actualDay = index - padding + 1;
          
          if(index <padding || actualDay > daysInMonth) return Container();

          return Container(child: Text('$actualDay'),);
        },
      ),
    );
  }
}
