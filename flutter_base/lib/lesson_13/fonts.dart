import 'package:flutter/material.dart';
import 'package:flutter_base/lesson_13/r_t_icons_icons.dart';

// https://www.fluttericon.com/

void main() {
  runApp(const MaterialApp(
    home: FontDemo(),
  ));
}

class FontDemo extends StatelessWidget {
  const FontDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Font demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Это пример шрифта",
              style: TextStyle(
                fontFamily: "Pacifico",
                fontSize: 26
              ),
            ),
            Text(
              "Это пример шрифта",
              style: TextStyle(
                fontFamily: "Rubik Puddles",
                fontSize: 26
              ),
            ),
            Text(
              "Это пример шрифта Open sans italic",
              style: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 20,
              ),
            ),
            Text(
              "Это пример шрифта Open sans italic",
              style: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 20,
                fontStyle: FontStyle.italic
              ),
            ),
            Text(
              "Это пример шрифта Open sans bold",
              style: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Это пример шрифта Open sans Extra",
              style: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            )
          ],
        ),
      ),
    );
  }
}
