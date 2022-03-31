/// Практика
// Напишите функцию, которая при заданном числе возвращает массив подмассивов возрастающей длины.
// Пример:
// pyramid(0) => [ ]
// pyramid(1) => [ [1] ]
// pyramid(2) => [ [1], [1, 1] ]
// pyramid(3) => [ [1], [1, 1], [1, 1, 1] ]

pyramid(int n) {
  // ваш код
  List result = List.generate(n, (index) => List.filled(n--, 1));
  return result.reversed;
}

// Напишите функцию, которая получает массив чисел и возвращаете сумму всех положительных.
// Пример:
// [1,-4,7,12] => 1 + 7 + 12 = 20

sumOfPositive(List<int> nums) {
  // Ваш код
  return nums.fold<int>(0, (acc, element) => element > 0 ? acc + element : acc);
}

void main(List<String> arguments) {
  pyramid(10);
  sumOfPositive([10, -2, 30, 2]);
}
