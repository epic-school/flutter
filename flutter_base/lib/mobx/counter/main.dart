import 'package:flutter/material.dart';
import 'package:flutter_base/mobx/counter/counter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
      home: MyHomePage(
        title: 'Flutter counter',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final counter = Counter();

  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (context) {
                return Text(
                  "${counter.value}",
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: counter.decrement,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
              backgroundColor: Colors.orange,
            ),
            FloatingActionButton(
              onPressed: counter.clear,
              tooltip: 'Clear',
              child: const Icon(Icons.delete),
              backgroundColor: Colors.red,
            ),
            FloatingActionButton(
              onPressed: counter.increment,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
              backgroundColor: Colors.green,
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
