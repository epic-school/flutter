/// Необходимо применить на практике знание ООП и придумать комбинацию классов и интерфейсов
/// которая будет удовлетворять всем правилам SOLID
/// 
/// Каждое правило вы должны раскрыть с помощью комментария к коду, что оно означает и
/// как вы его применяете конкретно в вашем коде.
/// 
/// Не запрещено брать примеры из вашего опыта или каких-либо источников, главное написать на Dart
/// и раскрыть суть правил SOLID
///

/// S: Single Responsibility Principle (Принцип единственной ответственности).
// Calculations and logic
abstract class Shape {
  double area();
}

class Square extends Shape {}
class Circle extends Shape {}
class Rectangle extends Shape {}

// UI painting
class ShapePainter {
  void paintSquare(Canvas c) {
    /* ... */ }
  void paintCircle(Canvas c) {
    /* ... */ }
  void paintTriangle(Canvas c) {
    /* ... */ }
}

// Networking
class ShapesOnline {
  String wikiArticle(String figure) {
    /* ... */ }
  void _cacheElements(String text) {
    /* ... */ }
}
///O: Open-Closed Principle (Принцип открытости-закрытости).
abstract class Area {
  const Area();

  double computeArea();
}

class Rectangle extends Area {
  final double width;
  final double height;
  const Rectangle(this.width, this.height);

  @override
  double computeArea() => width * height;
}

class Circle extends Area {
  final double radius;
  const Circle(this.radius);

  @override
  double computeArea() => radius * radius * 3.1415;
}

class AreaCalculator {
  double calculate(Area shape) => shape.computeArea();
}
///L: Liskov Substitution Principle (Принцип подстановки Барбары Лисков).
void main() {
  final Rectangle error = Square(3);

  // Creating a square with various sides lengths... what??
  error.width = 4;
  error.height = 8;
}

///I: Interface Segregation Principle (Принцип разделения интерфейса).
abstract class Worker {
  void work();
}

abstract class Sleeper {
  void sleep();
}

class Human implements Worker, Sleeper {
  void work() => print("I do a lot of work");
  void sleep() => print("I need 10 hours per night...");
}

class Robot implements Worker {
  void work() => print("I always work");
}

///D: Dependency Inversion Principle (Принцип инверсии зависимостей).
void main() {
  const fm = FileManager();

  fm.secureFile(const AlgoAES());
  fm.secureFile(const AlgoRSA());
}