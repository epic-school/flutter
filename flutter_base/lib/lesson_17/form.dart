import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: FormDemo(),
  ));
}


// Model
class SignInForm {
  String? email;
  String? password;
  int? age;

  SignInForm({this.email, this.password, this.age });
}

// Form
class FormDemo extends StatefulWidget {
  const FormDemo({Key? key}) : super(key: key);

  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final model = SignInForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Формы'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.send),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            log("Form valid ${model.email} and ${model.password}, age ${model.age}");
            return;
          }
          log("invalid");
        },
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Ваш Email',
                ),
                validator: (String? value) {
                  if (value == null || !value.contains('@')) {
                    return 'Введите корректный email';
                  }
                  return null;
                },
                onSaved: (value) {
                  model.email = value;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Ваш пароль',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите пароль';
                  }
                  return null;
                },
                onSaved: (value) {
                  model.password = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
