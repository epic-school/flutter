void main() {
  num n = 3;
  var i = -3;
  var d = 3.14;

  print(n.runtimeType);
  print(i.runtimeType);

//   final nums = <num>[3, 3.14];
//   print(nums);
//   print('--for--');
//   for (final el in nums) {
//     print(el.runtimeType);
//   }

// // Статика int
//   print('---int');
//   var x = int.parse('66');
//   print(x);
// //   x = int.parse('ss');
// //   print(x);
//   x = int.parse('aa', onError: (str) => 3);
//   print(x);
//   var y = int.tryParse('aa') ?? 0;
//   print(y);

// // Статика и константы double
//   print('---double');
//   d = double.infinity;
//   print(d);
//   d = double.maxFinite;
//   print(d);
//   d = double.minPositive;
//   print(d);
//   d = double.nan;
//   print(d);
//   d = double.negativeInfinity;
//   print(d);
//   d = double.parse('aa', (str) => 3.14);
//   print(d);
//   d = double.tryParse('aa') ?? 0.1;
//   print(d);

//   /// Способы записи чисел
//   var color = 0x2a;
//   print(color);
//   var exponents = 1.42e5;
//   print(exponents);

//   /// Свойства num
// // isFinite → bool
// // isInfinite → bool
// // isNaN → bool
// // isNegative → bool
// // sign → num

//   print('Число n ' + (n.isNegative ? 'отрицательное' : 'положительное'));
//   print('Число i ' + (i.isNegative ? 'отрицательное' : 'положительное'));

//   final a = i / 0;
//   print('Число a ' + (i.isFinite ? 'бесконечное' : 'конечное'));
//   print('Число a ' + (i.isNaN ? 'не число' : 'число'));
//   print('Знак числа i ' + i.sign.toString());

//   /// Свойства int
// // bitLength → int
// // isEven → bool
// // isOdd → bool

//   print('Число i записывается ' + i.bitLength.toString() + ' бита');
//   print('Число i ' + (i.isEven ? 'четное' : 'не четное'));
}
