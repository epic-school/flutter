import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String id;

  const UserPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User page"),),
      body: Column(
        children: [
          const Text("Ivan Ivanov"),
          const Text("Age: 28"),
          Text("Id: $id"),
        ],
      ),
    );
  }
}
