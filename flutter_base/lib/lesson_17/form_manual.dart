import 'dart:developer';

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
  final Map<String, String> errors = {};
  final TextEditingController _loginField = TextEditingController();

  void _sendToServer() {
    log(_loginField.text);
  }

  void _validate() {
    setState(() {
      errors.clear();
    });

    if(_loginField.text.isEmpty) {
      setState(() {
        errors.addAll({ '_loginField': 'required Field' });  
      });
    }
  }

  @override
  void dispose() {
    _loginField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log(errors.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Формы'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send),
        onPressed: _sendToServer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                label: const Text('Login'),
                errorText: errors['_loginField'],
              ),
              onChanged: (value) => _validate(),
              controller: _loginField,
            ),
          ],
        )
      ),
    );
  }
}
