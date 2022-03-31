import 'package:flutter/material.dart';

/// SizedBox
/// ConstrainedBox
/// UnconstrainedBox — https://api.flutter.dev/flutter/widgets/UnconstrainedBox-class.html
/// FractionallySizedBox — https://api.flutter.dev/flutter/widgets/FractionallySizedBox-class.html
/// FittedBox — https://api.flutter.dev/flutter/widgets/FittedBox-class.html
/// AspectRatio — https://api.flutter.dev/flutter/widgets/AspectRatio-class.html
///

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // body: Box(),
        // body: BoxWithConstrain(),
        // body: BoxWithoutConstrain(),
        // body: BoxFractionally(),
        // body: BoxFitted(),
        body: BoxAspect(),
      ),
    );
  }
}

class Decor extends StatelessWidget {
  final Color color;

  const Decor({
    Key? key,
    this.color = Colors.indigo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: color),
    );
  }
}

class Box extends StatelessWidget {
  const Box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 200.0,
        height: 200.0,
        child: Decor(),
      ),
    );
  }
}

class BoxWithConstrain extends StatelessWidget {
  const BoxWithConstrain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 200.0,
          maxHeight: 200.0,
          minHeight: 100.0,
          minWidth: 100.0,
        ),
        child: const SizedBox(
          width: 400.0,
          height: 400.0,
          child: Decor(),
        ),
      ),
    );
  }
}

class BoxWithoutConstrain extends StatelessWidget {
  const BoxWithoutConstrain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 150.0,
        height: 150.0,
        child: UnconstrainedBox(
          child: SizedBox(
            width: 200,
            height: 200,
            child: Decor(),
          ),
        ),
      ),
    );
  }
}

class BoxFractionally extends StatelessWidget {
  const BoxFractionally({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: FractionallySizedBox(
        widthFactor: 0.5,
        heightFactor: 0.5,
        alignment: FractionalOffset.center,
        child: Decor(),
      ),
    );
  }
}

class BoxFitted extends StatelessWidget {
  const BoxFitted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          ),
        ),
      ),
    );
  }
}

class BoxAspect extends StatelessWidget {
  const BoxAspect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        width: double.infinity,
        height: 100.0,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
