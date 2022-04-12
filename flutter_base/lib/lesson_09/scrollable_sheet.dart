import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: ScrollableSheetDemo(),
      )
  );
}

class ScrollableSheetDemo extends StatelessWidget {
  const ScrollableSheetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DraggableScrollableSheet'),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          minChildSize: 0.2,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 25.0,
                    spreadRadius: 5.0,
                    offset: Offset(
                      15.0,
                      15.0,
                    ),
                  )
                ],
            ),
              child: ListView.builder(
                controller: scrollController,
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Item $index'));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
