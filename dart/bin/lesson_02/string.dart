void main() {
//   /// Создание строковых переменных
//   var s = 'Single quotes';
//   s = "Double quotes";
//   s = 'Double quotes in "single" quotes';
//   s = "Single quotes in 'double' quotes";

//   s = '''A
// multiline
// string''';

//   s = """
// Another
// multiline
// string""";

//   /// Конструкторы
//   s = String.fromCharCode(68);
//   print(s);
//   s = String.fromCharCodes([68, 97, 114, 116]);
//   print(s);

//   /// Интерполяция и конкатинация
//   s = 'Dart ' + 'is ' + 'fun!';
//   print(s);
//   s = 'Dart ' 'is ' 'fun!';
//   print(s);

//   s = 'dartlang';
//   print('$s is cool');
//   print('$s has ${s.length} letters');

//   /// Строки это массивы
//   s = "Dart";
//   final charAtIndex = s[0];
//   print(charAtIndex);
//   print(s.length);

//   final runes = s.runes.toList();
//   print(runes);

//   /// основные свойства
//   print(s.length);
//   print(s.isEmpty);
//   print(s.isNotEmpty);
//   print(s.codeUnits);

//   /// Методы трансформации
//   print(s.toLowerCase());
//   print(s.toUpperCase());
//   print(s.padLeft(6, '_'));
//   print(s.padRight(6, '_'));
//   s = ' Dart ';
//   print(s.trim());
//   print(s.trimLeft());
//   print(s.trimRight());

//   /// Методы поиска
//   s = 'Dartlang';
//   print(s.startsWith('Da'));
//   print(s.endsWith('Da'));
//   print(s.indexOf('a'));
//   print(s.lastIndexOf('a'));
//   print(s.contains('la'));
//   print(s.substring(0, 4));

//   /// Преобразование строк
//   s = 'Dart,Java,Kotlin,Go';
//   print(s.split(','));
//   print(s.replaceAll('Kotlin', 'Swift'));
//   print(s.replaceFirst('Kotlin', 'Swift'));

//   /// etc... идем в документацию

//   /// Буфер для инкрементации
//   final buffer = StringBuffer();
//   buffer.write(' is open source');
//   print(buffer.length); // 19
//   print(buffer); // DART is open source

//   const int dartYear = 2011;
//   buffer
//     ..write(' since ') // Writes a string.
//     ..write(dartYear); // Writes an int.
//   print(buffer); // DART is open source since 2011
//   print(buffer.length); // 30

// // Альтернатива
//   var str = '';
//   str += 'hello ';
//   str += 'world!';
//   print(str);
}
