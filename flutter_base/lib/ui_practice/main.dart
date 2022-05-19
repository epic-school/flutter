import 'package:flutter/material.dart';
import './data.dart';

// https://www.figma.com/community/file/1066297521119881605?preview=fullscreen
// https://i.pravatar.cc/200

void main() {
  runApp(
    MaterialApp(
      home: ChatAppDemo(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ChatAppDemo extends StatelessWidget {
  const ChatAppDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
