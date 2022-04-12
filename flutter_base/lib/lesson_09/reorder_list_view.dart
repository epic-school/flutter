import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: ReorderListView(),
      )
  );
}

class ReorderListView extends StatefulWidget {
  ReorderListView({Key? key}) : super(key: key);

  @override
  State<ReorderListView> createState() => _ReorderListViewState();
}

class _ReorderListViewState extends State<ReorderListView> {
  List<int> data = List.generate(10, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ReorderListView")),
      body: ReorderableListView(
        children: <Widget>[
          for (int index = 0; index < data.length; index += 1)
            ListTile(
              key: Key('$index'),
              tileColor: index.isOdd ? Colors.blue.shade100 : Colors.blue.shade200,
              title: Text('Item ${data[index]}'),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = data.removeAt(oldIndex);
            data.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
