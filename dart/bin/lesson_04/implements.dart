// import 'dart:math' as math;
/// Объекты фигур: квадрат, круг, треугольник
/// Реализуем свойства описания фигуры
/// Реализуем метод рассчета площади
/// Напишем метод сравнения площадей фигур

abstract class Shape {
  String get name;
  double area();
}

class Square {}

class Circle {}

class Triangle {}

void main() {
  // final square = Square(name: 'Квадрат', size: 12.0);
  // print("${square.name} ${square.area().toString()} см.");

  // final circle = Circle(name: 'Круг', radius: 7.0);
  // print("${circle.name} ${circle.area().toString()} см.");

  // final triangle = Triangle(name: 'Треугольник', a: 10.0, b: 10, c: 14);
  // print("${triangle.name} ${triangle.area().toInt().toString()} см.");

  // print(square.compareTo(circle));
}

//import 'dart:math' as math;
// abstract class Shape {
//   String get name;

//   double area();

//   int compareTo(Shape other) {
//     final a = area();
//     final b = other.area();
//     if(a == b) return 0;

//     return a > b ? 1 : -1;
//   }
// }

// class Square extends Shape {
//   @override
//   final String name;
//   final double size;

//   Square({
//     required this.name,
//     required this.size,
//   });

//   @override
//   double area() {
//     return size * size;
//   }
// }

// class Circle extends Shape {
//   @override
//   final String name;
//   final double radius;

//   Circle({
//     required this.name,
//     required this.radius,
//   });

//   @override
//   double area() {
//     return 3.14 * radius * radius;
//   }
// }

// class Triangle extends Shape {
//   @override
//   final String name;
//   final double a;
//   final double b;
//   final double c;

//   Triangle({
//     required this.name,
//     required this.a,
//     required this.b,
//     required this.c,
//   });

//   @override
//   double area(){
//     final p = (a + b + c) / 2;
//     return math.sqrt(p*(p-a)*(p-b)*(p-c));
//   }
// }
