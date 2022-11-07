import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetWithFuture());
}

asyncFunc() async {
  await Future.delayed(const Duration(seconds: 2));
  return true;
}

class WidgetWithFuture extends StatelessWidget {
  const WidgetWithFuture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: asyncFunc(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Text("Has data");
            } else if (snapshot.hasError) {
              return const Text("Has error");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
