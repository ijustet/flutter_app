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
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}): super(key:key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  static final _controller = TextEditingController();
  static var _input = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body:Column(
        children: <Widget>[
          const Text(
            'Home Screen',
            style: const TextStyle(fontSize: 32),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _controller,
              style: const TextStyle(fontSize: 28),
              onChanged: changeField,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            label: 'Home',
            icon: const Icon(Icons.home, size: 32,),
          ),
          const BottomNavigationBarItem(
            label: 'next',
            icon: const Icon(Icons.navigate_next, size: 32,),
          )
        ],
        onTap: (int value){
          if(value == 1)
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen(_input)),
            );
        },
      ),
    );
  }

  void changeField(String val) => _input = val;
}
class SecondScreen extends StatelessWidget {
  final String _value;
  
  SecondScreen(this._value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next'),
      ),
      body: Center(
        child: Text(
          'you typed: "$_value".', 
          style: const TextStyle(fontSize: 32.0),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            label: 'prev',
            icon: const Icon(Icons.navigate_before, size: 32,),
          ),
          const BottomNavigationBarItem(
            label: '?',
            icon: const Icon(Icons.android, size: 32,),
          )
        ],
        onTap: (int value){
          if(value == 0) Navigator.pop(context);
        },
      ),
    );
  }
}
