import 'package:flutter/material.dart';

class Cat extends StatelessWidget {
  @override
  Widget build(context) {
    print('run');
    return const Image(
      image: NetworkImage('https://i.ibb.co/H4p4hF4/cat.png'),
    );
  }
}

class Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
