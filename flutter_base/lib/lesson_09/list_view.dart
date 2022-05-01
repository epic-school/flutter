import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: ListViewDemo(),
      )
  );
}

class ListViewDemo extends StatelessWidget {
  ListViewDemo({Key? key}) : super(key: key);

  final List<int> data = List.generate(1000, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView")),
      // body: ListView(
      //   children: [
      //     ...data.map((e) => ListTile(
      //       title: Text('This is title $e'),
      //       subtitle: const Text('This is sub title'),
      //     ),)
      //   ],
      // ),

      // body: ListView.separated(
      //   itemCount: data.length,
      //   separatorBuilder: (BuildContext context, int index) {
      //     if ((index + 1) % 10 == 0) {
      //       return const Center(child: Text('Separator'),);
      //     }
      //     return const Divider();
      //   },
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       title: Text('This is title ${data[index]}'),
      //       subtitle: const Text('This is sub title'),
      //     );
      //   },
      // ),

      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('This is title $index'),
            subtitle: const Text('This is sub title'),
          );
        },
      ),
    );
  }
}
