import 'package:carousel_slider/carousel_slider.dart';
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
            CarouselSlider(
              items: [
                Container(
                  width: 200,
                  color: Colors.amber,
                  child: Center(child: Text("Amber")),
                ),
                Container(
                  width: 200,
                  color: Colors.blue,
                  child: Center(child: Text("Blue")),
                ),
                Container(
                  width: 200,
                  color: Colors.red,
                  child: Center(child: Text("Red")),
                ),
                Container(
                  width: 200,
                  color: Colors.purple,
                  child: Center(child: Text("Purple")),
                ),
              ],
              options: CarouselOptions(
                height: 400,
                viewportFraction: 0.6,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (i, reason) {},
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
