// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        print('Коэф увеличения текста: ${mediaQuery.textScaleFactor}');
        print('Ориентация экрана: ${mediaQuery.orientation}');
        print('Отступы view: ${mediaQuery.viewPadding}');
        print('Height of Screen: ${mediaQuery.size.height}');
        print('Width of Screen: ${mediaQuery.size}');
        final realHeigth = mediaQuery.size.height - mediaQuery.padding.vertical;
        print('Эффективная высота: $realHeigth');
        return Scaffold(
          body: SafeArea(
            child: Container(
              height: realHeigth,
              color: Colors.indigo,
            ),
          ),
        );
      },
    );
  }
}
