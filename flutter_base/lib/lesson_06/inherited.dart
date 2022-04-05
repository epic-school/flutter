import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShapeColor(
        color: Colors.red,
        child: Square(),
      ),
    );
  }
}

class ShapeColor extends InheritedWidget {
  const ShapeColor({
    Key? key,
    required this.color,
    required Widget child,
  }) : super(key: key, child: child);

  final Color color;

  static ShapeColor of(BuildContext context) {
    final ShapeColor? result =
        context.dependOnInheritedWidgetOfExactType<ShapeColor>();
    assert(result != null, 'No ShapeColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ShapeColor oldWidget) => color != oldWidget.color;
}

class Square extends StatelessWidget {
  const Square({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = ShapeColor.of(context).color;
    return Scaffold(
      body: Center(
        child: Container(
          width: 150.0,
          height: 150.0,
          color: color,
        ),
      ),
    );
  }
}
