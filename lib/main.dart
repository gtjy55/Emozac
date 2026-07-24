import 'package:flutter/material.dart';

void main() => runApp(Emozac());

class Emozac extends StatelessWidget {
  const Emozac({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emozac',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;

    int padding = DateTime(currentYear, currentMonth, 1).weekday % 7;
    int daysInMonth = DateTime(currentYear, currentMonth + 1, 0).day;
    return Scaffold(
      appBar: AppBar(
        title: Text('$currentMonth 월'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          ),
        itemCount: padding + daysInMonth,
        itemBuilder: (context, index) {
          int actualDay = index - padding + 1;
          
          if(index <padding) return Container();

          return Container(child: Text('$actualDay'),);
        },
      ),
    );
  }
}
