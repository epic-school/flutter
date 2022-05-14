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

  final langsSelected = <String>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Checkbox'),
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
                      (e) => CheckboxListTile(
                        value: langsSelected.contains(e),
                        selected: langsSelected.contains(e),
                        onChanged: (value) {
                          if (langsSelected.contains(e)) {
                            langsSelected.remove(e);
                          } else {
                            langsSelected.add(e);
                          }
                          setState(() {});
                        },
                        title: Text(e),
                        tileColor: null,
                        checkColor: null,
                        activeColor: Colors.red,
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
                            Checkbox(
                              value: langsSelected.contains(e),
                              onChanged: (value) {
                                if (langsSelected.contains(e)) {
                                  langsSelected.remove(e);
                                } else {
                                  langsSelected.add(e);
                                }
                                setState(() {});
                              },
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
