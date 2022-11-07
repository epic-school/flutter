import 'package:flutter/material.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        body: Column(
          children: [
            Text('Hello world', key: key, semanticsLabel: "Label", style: const TextStyle(fontSize: 20),),
            Image.asset('assets/images/bg.png', width: 120, height: 120,),
          ],
        )
      ),
    );
  }
}
