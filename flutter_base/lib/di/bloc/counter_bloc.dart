import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'counter_events.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  final SharedPreferences _store;

  CounterBloc(this._store) : super(0) {
    on<CounterInit>(
      (event, emit) {
        final value = _store.getInt('counter') ?? 0;
        emit(value);
      },
    );

    on<CounterIncrementPassed>(
      (event, emit) {
        final value = state + 1;
        _save(value);
        emit(value);
      },
    );
    on<CounterDecrementPassed>((event, emit) {
      final value = state - 1;
      _save(value);
      emit(value);
    });
    on<CounterClearPassed>((event, emit) {
      _save(0);
      emit(0);
    });
  }

  void _save(int value) {
    _store.setInt('counter', value);
  }
}
