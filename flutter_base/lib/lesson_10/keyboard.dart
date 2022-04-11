import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MaterialApp(
    home: RawKeyboardDemo(),
  ));
}

class RawKeyboardDemo extends StatefulWidget {
  const RawKeyboardDemo({Key? key}) : super(key: key);

  @override
  State<RawKeyboardDemo> createState() => _RawKeyboardDemoState();
}

class _RawKeyboardDemoState extends State<RawKeyboardDemo> {
  final FocusNode _textNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raw keyboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: RawKeyboardListener(
          focusNode: _textNode,
          onKey: (event) {
            if (event.isKeyPressed(LogicalKeyboardKey.backspace)) {
              log('Backspace Pressed');
            }

            if (event.isKeyPressed(LogicalKeyboardKey.space)) {
              log('Space Pressed');
            }
          },
          child: Column(
            children: const [
              TextField(),
            ],
          )
        ),
      )
    );
  }
}
