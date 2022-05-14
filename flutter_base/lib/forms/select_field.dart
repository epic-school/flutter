import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/navigation/pop_result.dart';

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
  var dart = true;

  final langs = ['Swift', 'Kotlin', 'Dart'];

  var lang = 'Swift';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Select'),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Выбор языка'),
                          DropdownButton<String>(
                            value: lang,
                            items: langs
                                .map<DropdownMenuItem<String>>(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                lang = value ?? '';
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Box(
                child: Column(
                  children: [
                    Builder(
                      builder: (context) => GestureDetector(
                        onTap: () async {
                          final value = await showModalBottomSheet<String?>(
                            backgroundColor: Colors.black12,
                            enableDrag: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 400,
                                color: Colors.white,
                                padding: const EdgeInsets.all(16.0),
                                child: ListView.builder(
                                  itemCount: langs.length,
                                  itemBuilder: ((context, index) {
                                    return ListTile(
                                      title: Text(langs[index]),
                                      onTap: () {
                                        Navigator.of(context).pop(langs[index]);
                                      },
                                    );
                                  }),
                                ),
                              );
                            },
                          );
                          setState(() {
                            lang = value ?? lang;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 16.0,
                          ),
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Выбор языка'),
                              Text(
                                lang,
                                style: const TextStyle(
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Box(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final value = await showCupertinoModalPopup<String?>(
                          context: context,
                          builder: (BuildContext context) => Container(
                            height: 216,
                            padding: const EdgeInsets.only(top: 6.0),
                            // The Bottom margin is provided to align the popup above the system navigation bar.
                            margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            // Provide a background color for the popup.
                            color: CupertinoColors.systemBackground
                                .resolveFrom(context),
                            // Use a SafeArea widget to avoid system overlaps.
                            child: SafeArea(
                              top: false,
                              child: CupertinoPicker(
                                magnification: 1.22,
                                squeeze: 1.2,
                                useMagnifier: true,
                                itemExtent: 32.0,
                                // This is called when selected item is changed.
                                onSelectedItemChanged: (int selectedItem) {
                                  setState(() {
                                    lang = langs[selectedItem];
                                  });
                                },
                                children: List<Widget>.generate(
                                  langs.length,
                                  (int index) {
                                    return Center(
                                      child: Text(
                                        langs[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                        setState(() {
                          lang = value ?? lang;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 16.0,
                        ),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Выбор языка'),
                            Text(
                              lang,
                              style: const TextStyle(
                                color: Colors.teal,
                              ),
                            ),
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
