import 'dart:async';
import 'dart:io';
import 'dart:math';

///
/// Необходимо создать консольное приложение, которое слушало бы поток stdin
/// (stdin содержит метод listen) и отправляла бы полученные результаты в
/// другой поток, который обрабатывал бы их и выводил результат вычисления,
///
/// Обработка должна происходить следующим образом:
/// 1. Если число является квадратом для какого-либо целого числа: выводим
/// сообщение о том, квадратом какого числа является введенное число (см. тестовые данные)
///
/// 2. Если число не является квадратом для какого-либо целого числа: выводим
/// соответствующее сообщение
///
/// 3. Если введенное значение целым числом не является - поток не должен получить
/// его, сообщение выводим на этапе обработки значения в слушателе stdin
///
///////////////////////////////////////////////////////////////////////////////
/// Тестовые данные для проверки своего решения
///
/// 0
/// [Event handler] Event is square of 0
/// abc
/// [Stdin] Input must be integer
/// 23
/// [Event handler] Event is not a square of any integer number
/// 24
/// [Event handler] Event is not a square of any integer number
/// 121
/// [Event handler] Event is square of 11
/// 49
/// [Event handler] Event is square of 7
///

void main() {
  var streamController = StreamController();
  var stream = streamController.stream.asBroadcastStream();
  stream.listen((event) {
    var n = sqrt(event);
    if (n.ceil() == n) {
      print('[Event handler] Event is square of ${n.ceil()}');
    } else {
      print('[Event handler] Event is not a square of any integer number');
    }
  });

  stdin.listen((event) {
    String eventString = String.fromCharCodes(event);
    var num = int.tryParse(eventString);
    if (num != null && num >=0) {
      streamController.add(num);
    } else {
      print('[Stdin] Input must be integer');
    }
  });
}
