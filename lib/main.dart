import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
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
  static ui.Image? _img = null;
  static bool _flg = false;

  Future<void> loadAssetImage(String fname) async {
    final bd = await rootBundle.load("assets/images/$fname");
    final Uint8List u8lst = await Uint8List.view(bd.buffer);
    final codec = await ui.instantiateImageCodec(u8lst);
    final frameInfo = await codec.getNextFrame();
    _img = frameInfo.image;
    setState(()=> _flg = true);
  }

  @override
  Widget build(BuildContext context) {
    loadAssetImage('image.png');

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('App Name', style: TextStyle(fontSize: 30.0),),
      ),
      body:Container(
        child: CustomPaint(
          painter: MyPainter(_img),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter{
  ui.Image? _img = null;

  MyPainter(this._img) ;

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    final _img = this._img;
    if (_img != null) {
      Rect r0 = Rect.fromLTWH(0.0, 0.0, _img.width.toDouble(), _img.height.toDouble());
      Rect r = Rect.fromLTWH(50.0, 50.0, 100.0, 100.0);
      canvas.drawImageRect(_img, r0, r, p);
      r = Rect.fromLTWH(50.0, 250.0, 200.0, 100.0);
      canvas.drawImageRect(_img, r0, r, p);
      r = Rect.fromLTWH(250.0, 50.0, 100.0, 200.0);
      canvas.drawImageRect(_img, r0, r, p);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}