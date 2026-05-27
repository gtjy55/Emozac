import 'package:flutter/material.dart';

void main() => runApp(Emozac());

class Emozac extends StatelessWidget{
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emozac',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('page 1'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('top'),
            Text('mid'),
            Text('bottom')
          ],
        ),
      ),
    );
  }
}