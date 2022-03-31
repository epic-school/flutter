/// Практика
// Напишите функцию, которая при заданном числе возвращает массив подмассивов возрастающей длины.
// Пример:
// pyramid(0) => [ ]
// pyramid(1) => [ [1] ]
// pyramid(2) => [ [1], [1, 1] ]
// pyramid(3) => [ [1], [1, 1], [1, 1, 1] ]

pyramid(int n) {
  var DList = List.generate(n, (i) => List.filled(i,1), growable: false);
  print(DList);
  return DList;
// ваш код
}

// Напишите функцию, которая получает массив чисел и возвращаете сумму всех положительных.
// Пример:
// [1,-4,7,12] => 1 + 7 + 12 = 20

sumOfPositive(List<int> nums) {
  // Ваш код
  int sum = 0;
  for(int i=0; i < nums.length; i++){
    if(nums[i]>0){
      sum+=nums[i];
    }
  }
  print(sum);
  return sum;
}

void main(List<String> arguments) {
  pyramid(10);
  sumOfPositive([10, -2, 30, 3]);
}