/// Container
/// Safearea
/// Padding
/// AnimatedContainer
///

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  double width = 100;
  double height = 100;

  Color color = Colors.indigo;

  void change() {
    width = width > 100 ? 100 : 200;
    height = height < 100 ? 100 : 50;
    color = color == Colors.indigo ? Colors.green : Colors.indigo;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // body: BaseContainer(),
        // body: FullContainer(),
        body: GestureDetector(
          onTap: change,
          child: Animated(
            width: width,
            height: height,
            color: color,
          ),
        ),
      ),
    );
  }
}

class BaseContainer extends StatelessWidget {
  const BaseContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 300.0,
        height: 300.0,
        color: Colors.black,
        child: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FullContainer extends StatelessWidget {
  const FullContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350.0,
        height: 350.0,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.indigo,
              border: Border.all(
                color: Colors.white,
                width: 5.0,
              ),
              // borderRadius: BorderRadius.circular(20.0),
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.indigoAccent,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Animated extends StatelessWidget {
  final double width, height;
  final Color color;

  const Animated({
    Key? key,
    this.width = 100,
    this.height = 100,
    this.color = Colors.indigo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}
