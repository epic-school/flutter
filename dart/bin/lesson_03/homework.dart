/// Практика
// Напишите функцию, которая при заданном числе возвращает массив подмассивов возрастающей длины.
// Пример:
// pyramid(0) => [ ]
// pyramid(1) => [ [1] ]
// pyramid(2) => [ [1], [1, 1] ]
// pyramid(3) => [ [1], [1, 1], [1, 1, 1] ]

List pyramid(int n) {
  List<List> result = [];
  for (int i = 0; i < n; i++) {
    List subList = [];
    result.add(subList);
    for (int j = 0; j <= i; j++) {
      subList.add(1);
    }
  }
  return result;
}

// Напишите функцию, которая получает массив чисел и возвращаете сумму всех положительных.
// Пример:
// [1,-4,7,12] => 1 + 7 + 12 = 20

int sumOfPositive(List<int> nums) {
  int result = 0;
  for (var number in nums) {
    if (number > 0) result = result + number;
  }
  return result;
}


void main() {

  print(pyramid(3));
  print(sumOfPositive([10, -2, 30, 2]));
}