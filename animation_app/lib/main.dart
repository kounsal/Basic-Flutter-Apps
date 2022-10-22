import 'package:flutter/material.dart';
import 'src/screens/home.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Animation App',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
