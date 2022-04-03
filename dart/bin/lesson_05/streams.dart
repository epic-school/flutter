import 'dart:async';
import 'dart:io';

// Еще один пример работы с Streams
void main() {
  var streamController = StreamController();
  var stream = streamController.stream.asBroadcastStream();

  stream.listen((event) => print("(Listener #1) Input is: $event"));
  stream.listen((event) {
    var maybeInt = int.tryParse(event);

    if (maybeInt != null) {
      print("(Listener #2) Square of $event is ${maybeInt * maybeInt}");
    } else {
      print("(Listener #2) Input is not number!");
    }
  });

  var input = stdin.readLineSync();

  streamController.add(input);
}
