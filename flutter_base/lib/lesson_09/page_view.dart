import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: PageViewDemo(),
      )
  );
}

class PageViewDemo extends StatelessWidget {
  PageViewDemo({Key? key}) : super(key: key);

  final List<String> data = List.generate(10, (index) => index.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PageViewDemo")),
      body: PageView(
        // controller: PageController(
        //   viewportFraction: 0.9,
        //   initialPage: 0,
        // ),
        pageSnapping: false,
        onPageChanged: (value) {
          print(value);
        },
        children: [
          ...data.map(
            (e) => Container(
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
              child: Center(
                child: Text(e),
              ),
            ),
          )
        ],
      ),
    );
  }
}
