import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/counter_events.dart';

final locator = GetIt.instance;

Future setup() async {
  final storage = await SharedPreferences.getInstance();

  locator.registerSingleton<CounterBloc>(
    CounterBloc(storage)..add(CounterInit()),
  );
}
