// import 'dart:collection';
// import 'package:collection/collection.dart';

/// Collections
// 1. Объявление List и Map
// 2. Трансформации map, where, filter, add, addAll, indexOf, reduce, remove, hashcode.
// 3. Доп. методы if, for, spread.
// 4. Краткий обзор пакетов dart:collection и collection

void main(List<String> arguments) {
  List<String> fruitsList = ['Apple', 'Peach', 'Banana', 'Kiwi', 'Lemon'];
  Map<String, int> fruitsMap = { 'Apple': 1, 'Peach': 2 };
  Set<String> friutsSet = {'Apple', 'Peach'};


  // Constructors
  List<String> fruitsListCopy = List.of(fruitsList);
  // List<String> fruitsListCopy2 = List.from(fruitsList);
  // List<String> fruitsListCopy3 = List.generate(10, (index) => 'Apple');
  // List<String> fruitsListCopy4 = List.filled(10, 'Apple');
  // List<String> fruitsListCopy5 = [
  //   'Apple',
  //   'Peach',

  //   if (true)
  //     'Banana',

  //   for (var item in fruitsList)
  //     item,
   
  //   ...fruitsList,
  // ];

  // Methods
  // print(fruitsList.length);
  // print(fruitsList.first);
  // print(fruitsList.last);
  // print(fruitsList.isEmpty);
  // print(fruitsList.isNotEmpty);
  // print(fruitsList.hashCode);

  // fruitsList.add('Apple');
  // fruitsList.addAll(['Apple', 'Melon']);

  // fruitsList.clear();
  // fruitsList.remove('Apple');
  // fruitsList.removeAt(1);
  // fruitsList.removeWhere((element) => element == 'Apple');

  // fruitsList.setAll(1, ['Banana']);
  // fruitsList.setRange(1, 3, ['Banana', 'Kiwi']);
  // fruitsList.take(10);
  
  // print(fruitsList.any((element) => element == 'Apple'));
  // print(fruitsList.contains('Apple'));

  // print(fruitsList.toSet());
  // print(fruitsList.toList());

  // print(fruitsList.where((element) => element == 'Apple',));
  // print(fruitsList.indexWhere((element) => element == 'Apple'));
  // fruitsList.forEach((element) {
  //   print(element);
  // });
  // print(fruitsList.fold<int>(0, (previousValue, element) => previousValue + element.length));
  // print(fruitsList.reduce((value, element) => '$value, $element'));

  // fruitsList.sort();
  // fruitsList.sort((a, b) => a.length.compareTo(b.length));


  // MAP
  // print(fruitsMap.keys);
  // print(fruitsMap.values);

  // fruitsMap.putIfAbsent('Not exist', () => 10);
  // fruitsMap.containsKey('Not exist');
  // fruitsMap.containsValue(22);

  // SET
  // Set<String> otherFruitsSet = {'Apple', 'Watermelon'};
  // print(friutsSet.intersection(otherFruitsSet));

  // Collections package
  // final queue = Queue<int>();
  // print(queue.runtimeType);
  // queue.addAll([1, 2, 3]);
  // queue.addFirst(0);
  // queue.addLast(10);
  // print(queue);

  // queue.removeFirst();
  // queue.removeLast();
  // print(queue);

  // LinkedList
  // https://api.dart.dev/dev/2.17.0-155.0.dev/dart-collection/LinkedList-class.html

  // Collections 2
  // print(fruitsList == fruitsListCopy);

  // final eq = ListEquality();
  // print(eq.equals(fruitsList, fruitsListCopy));
}
