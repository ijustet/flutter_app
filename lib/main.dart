import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff2196f3),
        canvasColor: const Color(0xfffafafa),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('App Name', style: TextStyle(fontSize: 30.0),),
      ),
      body:Container(
        child: CustomPaint(
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    ui.ParagraphBuilder builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(textDirection: TextDirection.ltr),
    )
      ..pushStyle(ui.TextStyle(color: Colors.red, fontSize: 48.0))
      ..addText('Hello! ')
      ..pushStyle(ui.TextStyle(color: Colors.blue[700], fontSize: 30.0))
      ..addText('This is a sample of paragraph text. ')
      ..pushStyle(ui.TextStyle(color: Colors.blue[200], fontSize: 30.0))
      ..addText('You can draw MULTI-FONT text!');

    ui.Paragraph paragraph = builder.build()
      ..layout(ui.ParagraphConstraints(width: 300.0));

    Offset off = Offset(50.0, 50.0);
    canvas.drawParagraph(paragraph, off);
  }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
