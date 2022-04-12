import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: ScrollNotificationDemo(),
      )
  );
}

class ScrollNotificationDemo extends StatelessWidget {
  ScrollNotificationDemo({Key? key}) : super(key: key);

  final List<String> data = List.generate(100, (index) => index.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView")),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notify) {
          print(notify.metrics.extentBefore);
          return true;
        },
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('This is title $index'),
              subtitle: const Text('This is sub title'),
            );
          },
        ),
      ),
    );
  }
}
