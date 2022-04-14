import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: InteractiveViewerDemo(),
  ));
}

class InteractiveViewerDemo extends StatelessWidget {
  const InteractiveViewerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestures'),
      ),
      body: InteractiveViewer(
        // maxScale: 4.5,
        // scaleEnabled: false,
        // panEnabled: false,
        child: Image.network('https://images.unsplash.com/photo-1649103156470-7a818c99c744?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80'),
      )
    );
  }
}