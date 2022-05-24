import 'dart:async';

class Counter {
  var _counter = 0;

  final _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  void increment() {
    _counter++;
    _controller.add(_counter);
  }

  void decrement() {
    _counter--;
    _controller.add(_counter);
  }

  void clear() {
    _counter = 0;
    _controller.add(_counter);
  }
}
