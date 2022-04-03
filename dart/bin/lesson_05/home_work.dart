import 'dart:async';

import 'dart:io';

import 'dart:math';

void main() {
  var streamController = StreamController();
  var stream = streamController.stream.asBroadcastStream();

  stdin.listen((event) {
    final eventToString = String.fromCharCodes(event);
    var maybeInt = int.tryParse(eventToString);

    if(maybeInt != null && maybeInt >=0) {
      streamController.add(maybeInt);
    } else {
      print("[Stdin] Input must be integer");
    }
  });
  stream.listen((event) {
    final sqrtEvent=sqrt(event);
    if(sqrtEvent != sqrtEvent.roundToDouble()) {
      print("[Event handler] Event is not a square of any integer number");
    } else {
      print("[Event handler] Event is square ${sqrtEvent.toInt()}");
    }
  });
}