import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  late Animation<double> catAnimation;
  late AnimationController catController;
  late Animation<double> boxAnimation;
  late AnimationController boxController;

  @override
  initState() {
    super.initState();
    boxController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    boxAnimation = Tween(
      begin: pi / 1.5,
      end: pi / 1.6,
    ).animate(
      CurvedAnimation(
        parent: boxController,
        curve: Curves.linear,
      ),
    );

    catController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    catAnimation = Tween(begin: -35.0, end: -80.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: GestureDetector(
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              buildCatAnimation(),
              buildBox(),
              buildleftFlap(),
              buildrighftFlap()
            ],
          ),
        ),
        onTap: () {
          if (catController.status == AnimationStatus.completed) {
            print("1");
            catController.reverse();
            boxController.reverse();
          } else if (catController.status == AnimationStatus.dismissed) {
            catController.forward();
            boxController.forward();
            print("2");
          }
        },
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          top: catAnimation.value,
          right: 0.0,
          left: 0.0,
          child: child as Widget,
        );
      },
      child: Cat(),
    );
  }

  Widget buildleftFlap() {
    return Positioned(
      left: 5,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          height: 10,
          width: 100,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
            alignment: Alignment.topLeft,
            angle: boxAnimation.value,
            child: child,
          );
        },
      ),
    );
  }

  Widget buildrighftFlap() {
    return Positioned(
      right: 5,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          height: 10,
          width: 100,
          color: Colors.brown,
        ),
        builder: (context, child) {
          return Transform.rotate(
            alignment: Alignment.topRight,
            angle: -boxAnimation.value,
            child: child,
          );
        },
      ),
    );
  }
}

Widget buildBox() {
  return Container(
    height: 200.0,
    width: 200.0,
    color: Colors.brown,
  );
}
