import 'package:mobx/mobx.dart';

class Counter {
  late Action increment;

  final _value = Observable(0); // Observable<int>

  int get value => _value.value; // int

  set value(int newValue) => _value.value = newValue;

  void _increment() {
    _value.value++;
  }

  Counter() {
    increment = Action(_increment);
  }
}

// (new) Action Action(
//   Function fn, {
//   ReactiveContext? context,
//   String? name,
// })