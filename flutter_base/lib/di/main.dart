import 'package:flutter/material.dart';
import 'package:flutter_base/di/bloc/counter_bloc.dart';
import 'package:flutter_base/di/setup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/counter_events.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

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

  final counter = GetIt.instance.get<CounterBloc>();

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
            BlocBuilder<CounterBloc, int>(
              bloc: counter,
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                counter.add(CounterDecrementPassed());
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
              backgroundColor: Colors.orange,
            ),
            FloatingActionButton(
              onPressed: () {
                counter.add(CounterClearPassed());
              },
              tooltip: 'Clear',
              child: const Icon(Icons.delete),
              backgroundColor: Colors.red,
            ),
            FloatingActionButton(
              onPressed: () {
                counter.add(CounterIncrementPassed());
              },
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
