import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: DismissibleDemo(),
  ));
}

// https://docs.flutter.dev/development/accessibility-and-localization/accessibility

class DismissibleDemo extends StatefulWidget {
  const DismissibleDemo({Key? key}) : super(key: key);

  @override
  State<DismissibleDemo> createState() => _DismissibleDemoState();
}

List<int> items = List<int>.generate(100, (int index) => index);

class _DismissibleDemoState extends State<DismissibleDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dismissible'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey<int>(items[index]),
            child: ListTile(
              title: Text(
                'Item ${items[index]}',
              ),
            ),
            // direction: DismissDirection.vertical,
            background: Container(
              color: Colors.blue,
              alignment: Alignment.centerLeft,
              child: const Text("Confirm"),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Text("Remove"),
            ),
            onDismissed: (direction) {
              log(direction.name);
              setState(() {
                items.removeAt(index);
              });
            },
            // confirmDismiss: (direction) async {
            //   return await showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return AlertDialog(
            //         content: Text("Удалить строку ${items[index]}?"),
            //         actions: <Widget>[
            //           TextButton(
            //             child: const Text("Отмена"),
            //             onPressed: () {
            //               Navigator.of(context).pop();
            //             },
            //           ),
            //           TextButton(
            //             child: const Text("Удалить",),
            //             onPressed: () {
            //               setState(() {
            //                 items.removeAt(index);
            //               });
            //               Navigator.of(context).pop();
            //             },
            //           ),
            //         ],
            //       );
            //     },
            //   );
            // },
          );
        },
      ),
    );
  }
}
