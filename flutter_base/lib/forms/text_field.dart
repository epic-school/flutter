import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Fields(),
    );
  }
}

class Fields extends StatelessWidget {
  const Fields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Текстовые поля'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 30.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Box(
                child: TextField(
                  key: Key('f1'),
                  decoration: InputDecoration(
                      // Label
                      labelText: 'Label field',
                      labelStyle: TextStyle(color: Colors.red),
                      floatingLabelStyle: TextStyle(color: Colors.blue),
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      alignLabelWithHint: true,
                      floatingLabelBehavior: FloatingLabelBehavior.auto,

                      // Hint
                      hintText: 'Placeholder',
                      hintTextDirection: null,
                      hintStyle: null,
                      hintMaxLines: null,

                      // Helper
                      helperText: 'Helper text',
                      helperStyle: null,
                      helperMaxLines: null,

                      // Error
                      errorText: 'Error text',
                      errorStyle: null,
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Colors.teal,
                        ),
                      ),
                      errorMaxLines: 1,
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Colors.blue,
                        ),
                      ),

                      // Icon
                      // icon: Icon(Icons.lock),
                      // iconColor: null,

                      // Prefix
                      prefix: null,
                      prefixIcon: null,
                      prefixIconColor: null,
                      prefixIconConstraints: null,
                      prefixText: '+7 ',
                      prefixStyle: null,

                      // Suffix
                      suffix: null,
                      suffixIcon: null,
                      suffixIconColor: null,
                      suffixIconConstraints: null,
                      suffixText: null,
                      suffixStyle: null,

                      //Counter
                      counter: null,
                      counterText: '0/0',
                      counterStyle: null),
                ),
              ),
              Box(
                child: TextField(
                  key: const Key('f2'),
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    isCollapsed: true,
                    contentPadding: const EdgeInsets.all(10.0),
                    // Border
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    disabledBorder: null,
                    errorBorder: null,
                    focusedErrorBorder: null,
                  ),
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                  obscureText: true,
                  obscuringCharacter: '#',
                  maxLength: 10,
                ),
              ),
              const Box(
                child: TextField(
                  key: Key('f3'),
                  decoration: InputDecoration(
                    hintText: 'Комментарий',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    isCollapsed: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                  maxLines: 8,
                  minLines: 4,
                  maxLength: 500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final Widget child;
  const Box({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: child,
    );
  }
}
