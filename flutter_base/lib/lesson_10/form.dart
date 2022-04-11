import 'dart:developer';

import 'package:flutter/material.dart';
// Ext
import 'validators.dart';

void main() {
  runApp(MaterialApp(
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
          // _formKey.currentState!.reset();
          log("invalid");
        },
      ),
      body: Form(
        key: _formKey,
        // autovalidateMode: AutovalidateMode.disabled,
        // onChanged: () {
        //   log("on form change");
        // },
        // onWillPop: () {
        //   log("on will change");
        //   return false;
        // },
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              TextFormField(
                // initialValue: 'Initial email',
                // keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Ваш Email',
                ),
                // validator: (String? value) => !value!.isValidEmail ? 'Введите корректный email' : null,
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
                // validator: (String? value) => !value!.isValidPassword ? 'Введите корректный пароль' : null,
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
              // const SizedBox(height: 20,),
              // CustomCounterField(
              //   onSaved: (value) {
              //     model.age = value;
              //   }
              // )
            ],
          ),
        ),
      ),
    );
  }
}


class CustomCounterField extends StatelessWidget {
  const CustomCounterField({
    Key? key,
    this.onSaved,
    this.initialValue = 0,
    this.enabled = true,
  }) : super(key: key);

  final FormFieldSetter<int>? onSaved;
  final int initialValue;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      initialValue: initialValue,
      enabled: enabled,
      onSaved: onSaved,
      builder: (field) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                field.didChange(field.value! - 1);
              },
            ),
            Text(
              field.value.toString()
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                field.didChange(field.value! + 1);
              },
            ),
          ],
        );
      },
    );
  }
}
