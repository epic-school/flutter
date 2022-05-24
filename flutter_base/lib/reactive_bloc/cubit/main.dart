import 'package:flutter/material.dart';
import 'package:flutter_base/reactive_bloc/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  final cubit = CounterCubit();

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
            BlocBuilder<CounterCubit, CounterState>(
              bloc: cubit,
              builder: (context, state) {
                if (state is CounterLoadedState) {
                  return Text(
                    "${state.value} (${state.prevValue})",
                    style: Theme.of(context).textTheme.headline4,
                  );
                }

                if (state is CounterLoadingState) {
                  return const SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(),
                  );
                }

                return const SizedBox.shrink();
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
              onPressed: cubit.decrement,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
              backgroundColor: Colors.orange,
            ),
            FloatingActionButton(
              onPressed: cubit.clear,
              tooltip: 'Clear',
              child: const Icon(Icons.delete),
              backgroundColor: Colors.red,
            ),
            FloatingActionButton(
              onPressed: cubit.increment,
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
