import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: FormManualDemo(),
  ));
}

// Form
class FormManualDemo extends StatefulWidget {
  const FormManualDemo({Key? key}) : super(key: key);

  @override
  State<FormManualDemo> createState() => _FormManualDemoState();
}

class _FormManualDemoState extends State<FormManualDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Формы'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send),
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: const [
            TextField(
              decoration: InputDecoration(
                label: Text('Login'),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Password'),
              ),
            ),
          ],
        )
      ),
    );
  }
}
