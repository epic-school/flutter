/// flutter pub run build_runner build --delete-conflicting-outputs
/// flutter pub run build_runner watch --delete-conflicting-outputs
import 'package:mobx/mobx.dart';

part 'counter_gen.g.dart';

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
}
