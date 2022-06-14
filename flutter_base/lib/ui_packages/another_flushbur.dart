import 'package:another_flushbar/flushbar.dart';
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
            MaterialButton(onPressed: () {
              Flushbar(
                title: "Hello world!",
                message: "Lorem Ipsum",
                duration: const Duration(milliseconds: 2500),
                icon: Icon(Icons.info_outline, size: 32.0, color: Colors.blue[300],),
                leftBarIndicatorColor: Colors.blue[300],
                margin: const EdgeInsets.all(10.0),
                borderRadius: BorderRadius.circular(10.0),
                backgroundColor: Colors.white,
                titleColor: Colors.black87,
                messageColor: Colors.black45,
                boxShadows: [BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 4.0, offset: const Offset(0,4))],
              ).show(context);
            }, child: const Text("Show flushbar"), color: Colors.purple, textColor: Colors.white,),
          ],
        ),
      ),
    );
  }
}
