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

class Fields extends StatefulWidget {
  const Fields({Key? key}) : super(key: key);

  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  final langs = [
    'Dart/Flutter',
    'Kotlin/Jav',
    'Swift/Objectiv-c',
  ];

  var lang = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Radio'),
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
              Box(
                child: Column(
                  children: [
                    ...langs.map(
                      (e) => RadioListTile<String>(
                        title: Text(e),
                        value: e,
                        groupValue: lang,
                        toggleable: true,
                        visualDensity: VisualDensity.comfortable,
                        onChanged: (value) {
                          setState(() {
                            lang = value ?? '';
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Box(
                child: Column(
                  children: [
                    ...langs.map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e),
                            Radio<String>(
                              value: e,
                              groupValue: lang,
                              toggleable: true,
                              visualDensity: VisualDensity.compact,
                              onChanged: (value) {
                                setState(() {
                                  lang = value ?? '';
                                });
                              },
                              activeColor: Colors.cyanAccent,
                              fillColor:
                                  MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors.red;
                                }
                              }),
                              focusColor: Colors.yellow,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
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
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: child,
    );
  }
}
