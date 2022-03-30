/// Демонстрация особенностей работы Dart event loop
///
// void main() {
//   print("A");
//   Future(() {
//     print("B");
//     Future.microtask(() => print("C"));
//     Future(() => print("D"));
//     print("E");
//   });
//   print("F");
// }
// Output:
// A
// F
// B
// E
// C
// D

/// Future API
// void main() {
//   Future<int> someInt = getIntAsync();
//
//   someInt.whenComplete(() => print("Completed!"));
//
//   print("Sync print");
//
//   someInt.then((value) => print(value));
//
//   print("Sync print 2");
// }
//
// Future<int> getIntAsync() async {
//   return 1;
// }
// Output:
// Sync print
// Sync print 2
// 1

/// Async-Await
// void main() async {
//   Future<int> someInt = getIntAsync();
//
//   print("Sync print");
//
//   print(await someInt);
//
//   print("Sync print 2");
// }
//
// Future<int> getIntAsync() async {
//   return 1;
// }

// Output:
// Sync print
// 1
// Sync print 2

/// Пример с задержкой с Future API
// void main() {
//   print("Sync print");
//
//   getIntDelayed(1).then((value) => print(value));
//
//   print("Sync print 2");
// }
//
// Future<int> getIntDelayed(int delayInSeconds) {
//   return Future.delayed(Duration(seconds: delayInSeconds), () => 1);
// }

/// Пример с задержкой с async-await
// void main() async {
//   print("Sync print");
//
//   print(await getIntDelayed(1));
//
//   print("Sync print 2");
// }
//
// Future<int> getIntDelayed(int delayInSeconds) {
//   return Future.delayed(Duration(seconds: delayInSeconds), () => 1);
// }