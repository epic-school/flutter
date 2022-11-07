import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetWithState());
}

class WidgetWithState extends StatefulWidget {
  const WidgetWithState({Key? key}) : super(key: key);

  @override
  State<WidgetWithState> createState() => WidgetWithStateState();
}

@visibleForTesting
class WidgetWithStateState extends State<WidgetWithState> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter $counter'),
          ]
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.plus_one),
          onPressed: () {
            setState(() {
              counter += 1;
            });
          }
        ),
      ),
    );
  }
}
