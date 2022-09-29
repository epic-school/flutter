import 'package:flutter/material.dart';

class CommentsPage extends StatelessWidget {
  final List<String> list;

  const CommentsPage({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Comments"),),
      body: Column(
        children: [
          ...list.map((e) => Text(e))
        ],
      ),
    );
  }
}
