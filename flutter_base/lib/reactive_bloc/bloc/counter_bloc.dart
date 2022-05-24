import 'package:bloc/bloc.dart';

abstract class CounterEvent {}

class CounterIncrementPassed extends CounterEvent {}

class CounterDecrementPassed extends CounterEvent {}

class CounterClearPassed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPassed>(
      (event, emit) {
        emit(state + 1);
      },
    );
    on<CounterDecrementPassed>((event, emit) {
      emit(state - 1);
    });
    on<CounterClearPassed>((event, emit) {
      emit(0);
    });
  }
}
