import 'package:mobx/mobx.dart';

part 'counter.g.dart';

class Counter = _CounterBase with _$Counter;

abstract class _CounterBase with Store {
  @observable
  int _value = 0;

  @computed
  int get value => _value;

  @action
  void increment() {
    _value++;
  }

  @action
  void decrement() {
    _value--;
  }

  @action
  void clear() {
    _value = 0;
  }
}
