import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: GridViewDemo(),
    )
  );
}

class GridViewDemo extends StatelessWidget {
  GridViewDemo({Key? key}) : super(key: key);

  final List<String> data = List.generate(1000, (index) => index.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridViewDemo")),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 140.0,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          childAspectRatio: 1,
        ),
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 30,
            height: 30,
            color: Colors.blue.shade200,
            margin: const EdgeInsets.all(4),
            child: Text(index.toString()),
          );
        },
      ),
    );
  }
}
