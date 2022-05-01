import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: SingleChildDemo(),
      )
  );
}

class SingleChildDemo extends StatefulWidget {
  SingleChildDemo({Key? key}) : super(key: key);

  @override
  State<SingleChildDemo> createState() => _SingleChildDemoState();
}

class _SingleChildDemoState extends State<SingleChildDemo> {
  final List<int> data = List.generate(20, (index) => index);

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(_onScrollEvent);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrollEvent);
    super.dispose();
  }

  void _onScrollEvent() {
    print("Extent after: ${_controller.position.extentAfter}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SingleChildScrollView"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
        onPressed: () {
          _controller.animateTo(
            _controller.position.extentBefore + 120,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.ease,
          );
        },
      ),
      body: SingleChildScrollView(
        controller: _controller,
        //  padding: const EdgeInsets.all(40),
        // scrollDirection: Axis.horizontal,
        // reverse: true,
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        // physics: const NeverScrollableScrollPhysics(),
        // physics: const PageScrollPhysics(),
        child: Column(
          children: [
            ...data.map(
              (e) => ListTile(
                title: Text('This is title $e'),
                subtitle: const Text('This is sub title'),
              ),
            )
            .toList(),
          ],
        ),
        // child: Row(
        //   children: [
        //     ...data.map(
        //       (e) => Container(
        //         width: 200,
        //         height: 200,
        //         color: Colors.blue.shade200,
        //         margin: const EdgeInsets.only(right: 4),
        //         child: Center(child: Text('This is title $e'),),
        //       ),
        //     )
        //     .toList(),
        //   ],
        // ),
      ),
    );
  }
}
