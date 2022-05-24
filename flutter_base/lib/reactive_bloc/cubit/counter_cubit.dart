import 'package:bloc/bloc.dart';

abstract class CounterState {}

class CounterLoadingState extends CounterState {}

class CounterLoadedState extends CounterState {
  final int value;
  final int prevValue;

  CounterLoadedState({
    this.value = 0,
    this.prevValue = 0,
  });
}

class CounterCubit extends Cubit<CounterState> {
  var _counter = 0;

  CounterCubit() : super(CounterLoadedState());

  void increment() async {
    emit(CounterLoadingState());
    await Future.delayed(const Duration(seconds: 1));

    final prev = _counter;

    emit(CounterLoadedState(
      value: ++_counter,
      prevValue: prev,
    ));
  }

  void decrement() async {
    emit(CounterLoadingState());
    await Future.delayed(const Duration(seconds: 1));

    final prev = _counter;

    emit(CounterLoadedState(
      value: --_counter,
      prevValue: prev,
    ));
  }

  void clear() async {
    emit(CounterLoadingState());
    await Future.delayed(const Duration(seconds: 1));

    final prev = _counter;
    _counter = 0;
    emit(CounterLoadedState(
      value: _counter,
      prevValue: prev,
    ));
  }
}
