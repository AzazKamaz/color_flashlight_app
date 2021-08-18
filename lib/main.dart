import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Flashlight Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Color Flashlight Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _color = randomColor();
  Color _colorNext = randomColor();

  static Color randomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _color = _colorNext;
            _colorNext = randomColor();
          });
        },
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: _color,
          ),
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }
}
