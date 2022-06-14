import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String hello = "Hello world!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modal bottom sheet"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(onPressed: (){
              showCupertinoModalBottomSheet(context: context, builder: (ctx) {
                return Material(
                  child: SizedBox(height: 400, child: Center(child: Text(hello),)),
                );
              });
            }, child: const Text("Open cupertino modal"), color: Colors.purple, textColor: Colors.white,),
            MaterialButton(onPressed: () {
              showMaterialModalBottomSheet(context: context, builder: (ctx) {
                return const Material(
                  child: SizedBox(height: 400, child: Center(child: Text("Material bottom sheet"),)),
                );
              });
            }, child: const Text("Open material modal"), color: Colors.purple, textColor: Colors.white,),
            MaterialButton(onPressed: () {
              showBarModalBottomSheet(context: context, builder: (ctx) {
                return const Material(
                  child: SizedBox(height: 400, child: Center(child: Text("Cupertino bottom sheet"),)),
                );
              });
            }, child: const Text("Open bar modal"), color: Colors.purple, textColor: Colors.white,),
          ],
        ),
      )
    );
  }
}
