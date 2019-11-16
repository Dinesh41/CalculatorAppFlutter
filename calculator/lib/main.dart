import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget createButton(buttonText,int flex) {
    return Expanded(
      flex: flex,
      child: FlatButton(
        padding: EdgeInsets.all(15),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 25),
        ),
        onPressed: () {},
        color: Colors.blueGrey,
        textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0,20,0,0),
              child: Text(
                '0',
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    createButton('C',1),
                    createButton('N',1),
                    createButton('%',1),
                    createButton('/',1)
                  ],
                ),
                Row(
                  children: <Widget>[
                    createButton('7',1),
                    createButton('8',1),
                    createButton('9',1),
                    createButton('X',1)
                  ],
                ),
                Row(
                  children: <Widget>[
                    createButton('4',1),
                    createButton('5',1),
                    createButton('6',1),
                    createButton('-',1)
                  ],
                ),
                Row(
                  children: <Widget>[
                    createButton('1',1),
                    createButton('2',1),
                    createButton('3',1),
                    createButton('+',1)
                  ],
                ),
                Row(
                  children: <Widget>[
                    createButton('Clear',2),
                    createButton('.',1),
                    createButton('=',1),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
