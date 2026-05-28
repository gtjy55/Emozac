import 'package:flutter/material.dart';

void main() => runApp(Emozac());

class Emozac extends StatelessWidget{
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emozac',
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: Drawer( //add AppBar menu icons
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                // backgroundImage: ,
                // backgroundColor: ,
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.amber,
                ),
              ],
              accountName: Text('test'),
              accountEmail: Text('test@gmail.com'),
              onDetailsPressed:(){
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                color: Colors.purple[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0)
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,
              color: Colors.grey[850],
              ),
              title: Text('Home'),
              onTap: (){
                print('Home is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text('Settings'),
              onTap: (){
                print('Settings is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text('Question_answer'),
              onTap: (){
                print('Qusetion_answer is clicked');
              },
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}