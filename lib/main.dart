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
      initialRoute: '/',
      routes: {
        '/' : (context) => FirstScreen(),
        '/second' : (context) => SecondScreen('Second'),
        '/third' : (context) => SecondScreen('Third'),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {

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
            Navigator.pushNamed(context, '/second');
        },
      ),
    );
  }
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
          '$_value Screen', 
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
          if(value == 1) Navigator.pushNamed(context, '/third');
        },
      ),
    );
  }
}
