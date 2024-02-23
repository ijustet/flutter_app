// import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: const Color(0xFFe91e63),
        accentColor: const Color(0xFFe91e63),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static var _message = 'ok.';
  static var _selected = 'Child 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                _message,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto"
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: PopupMenuButton(
                onSelected: (String value)=> popupSelected(value),
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(value: "Child 1",
                  child: const Text("Child 1")),
                  const PopupMenuItem<String>(value: "Child 2",
                  child: const Text("Child 2")),
                  const PopupMenuItem<String>(value: "Child 3",
                  child: const Text("Child 3")),
                ]
              ),
            ),
          ]
  
        ),
      ),
    );
  }

  void popupSelected(String value) {
    setState(() {
      _selected = value ?? 'not selected...';
      _message = 'select: $_selected';
    });
  }
}

