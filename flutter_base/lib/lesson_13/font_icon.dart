import 'package:flutter/material.dart';
import 'package:flutter_base/lesson_13/r_t_icons_icons.dart';

// https://www.fluttericon.com/

void main() {
  runApp(const MaterialApp(
    home: FontIconsDemo(),
  ));
}

class FontIconsDemo extends StatelessWidget {
  const FontIconsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Font icon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: const [
            Icon(Icons.add, color: Colors.green,),

            // Icon(RTIcons.add_box, color: Colors.blue,),
            // Icon(RTIcons.add_a_photo, color: Colors.blue,),
            // Icon(RTIcons.add_circle, color: Colors.blue,),
          ],
        ),
      ),
    );
  }
}
