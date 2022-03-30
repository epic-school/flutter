import 'dart:convert';
import 'dart:io';

/// Пример простого синхронного генератора
// void main() {
//   var intList = syncGenerator();
//
//   print(intList.toList());
// }
//
// Iterable<int> syncGenerator() sync* {
//   int i = 0;
//
//   while(i < 10) {
//     i++;
//     yield i;
//   }
// }

/// Пример рекурсивного синхронного генератора
// Iterable<int> oddNumbersGenerator(int n) sync* {
//   if (n > 0) {
//     if (n % 2 != 0) {
//       yield n;
//     }
//     yield* oddNumbersGenerator(n - 1);
//   }
// }
//
// void main(List<String> args) {
//   oddNumbersGenerator(5).forEach(print);
// }

/// Пример асинхронного генератора
// void main() {
//   var intListStream = asyncGenerator();
//  
//   intListStream.listen((event) => print(event));
// }
//
// Stream<int> asyncGenerator() async* {
//   int i = 0;
//  
//   while(i < 10) {
//     i++;
//     yield i;
//   }
// }

/// Реальный (упрощенный) пример использования генератора
// void main() async {
//   var file = File('bigfile.txt');
//
//   var fileRAF = file.openSync();
//
//   var i = 0;
//
//   chunkFileReader(fileRAF, 60000).listen((event) {
//     // print(event);
//
//     i++;
//   });
//  
//   Future(() => print("Total chunks: $i"));
// }
//
// Stream<String> chunkFileReader(RandomAccessFile raf, int chunkSize) async* {
//   var offset = 0;
//
//   final fileLength = raf.lengthSync();
//
//   while (offset < fileLength) {
//     raf.setPositionSync(offset);
//
//     var chunkBuffer = raf.readSync(chunkSize);
//
//     yield utf8.decode(chunkBuffer);
//
//     offset += chunkSize;
//   }
// }
