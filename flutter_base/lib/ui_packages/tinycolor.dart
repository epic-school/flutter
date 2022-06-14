import 'package:tinycolor2/tinycolor2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.amber, Colors.amber.darken(10)],
                ),
              ),
              child: const Center(
                child: Text(
                  "JD",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48.0,
                  ),
                ),
              ),
            ),
            Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [const Color(0xFFECEDF6), const Color(0xFFECEDF6).darken(10)],
                ),
              ),
              child: Center(
                child: Text(
                  "JD",
                  style: TextStyle(
                    color: Color(0xFFECEDF6).isLight ? Colors.black45 : Colors.white,
                    fontSize: 48.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
