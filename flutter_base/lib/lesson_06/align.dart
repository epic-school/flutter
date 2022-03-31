import 'package:flutter/material.dart';

/// Align — https://api.flutter.dev/flutter/widgets/Align-class.html
///

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var x = 0.0;
  var y = 0.0;

  void move() {
    x = x == 0.0 ? 1.0 : 0;
    y = y == 0.0 ? -1.0 : 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: Shape(),
        // body: AlignCenter(),
        // body: AlignCenterBottom(),
        // body: AlignShiftCenter(),
        // body: AlignFractional(),
        // body: AlignFactor(),
        body: Animated(
          x: x,
          y: y,
        ),
        floatingActionButton: FloatingActionButton(onPressed: move),
      ),
    );
  }
}

class Shape extends StatelessWidget {
  const Shape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      height: 100.0,
      width: 100.0,
    );
  }
}

class AlignCenter extends StatelessWidget {
  const AlignCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Shape(),
    );
  }
}

class AlignCenterBottom extends StatelessWidget {
  const AlignCenterBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Shape(),
    );
  }
}

class AlignShiftCenter extends StatelessWidget {
  const AlignShiftCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment(-1, 1),
      child: Shape(),
    );
  }
}

class AlignFractional extends StatelessWidget {
  const AlignFractional({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: FractionalOffset(0.5, 0.5),
      child: Shape(),
    );
  }
}

class AlignFactor extends StatelessWidget {
  const AlignFactor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        color: Colors.green,
        width: 300.0,
        height: 200.0,
      ),
      widthFactor: 2,
      heightFactor: 2,
    );
  }
}

class Animated extends StatelessWidget {
  final double x, y;

  const Animated({
    Key? key,
    this.x = 0,
    this.y = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 500),
      alignment: Alignment(x, y),
      child: const Shape(),
    );
  }
}
