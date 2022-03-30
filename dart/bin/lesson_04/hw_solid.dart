/// Необходимо применить на практике знание ООП и придумать комбинацию классов и интерфейсов
/// которая будет удовлетворять всем правилам SOLID
///
/// Каждое правило вы должны раскрыть с помощью комментария к коду, что оно означает и
/// как вы его применяете конкретно в вашем коде.
///
/// Не запрещено брать примеры из вашего опыта или каких-либо источников, главное написать на Dart
/// и раскрыть суть правил SOLID
///

abstract class Coffee {
  addCoffee() {
    print("Добавлено кофе");
  }

  makeCoffee() {}
}

abstract class CappuccinoInterface {
  // I — Interface Segregation (Принцип разделения интерфейсов)
  // Каждый интерфейс содержит только минимальный набор методов для приготовления напитка
  makeCappuccino() {}
}

abstract class GlaceInterface {
  // I — Interface Segregation (Принцип разделения интерфейсов)
  // Каждый интерфейс содержит только минимальный набор методов для приготовления напитка
  makeGlace() {}
}

abstract class EspressoInterface {
  // I — Interface Segregation (Принцип разделения интерфейсов)
  // Каждый интерфейс содержит только минимальный набор методов для приготовления напитка
  makeEspresso() {}
}

// S – Single Responsibility (Принцип единственной ответственности)
// под приготовление каждого кофейного напитка создается отдельный класс:
// Эспрессо, Капуччино, Гляссе

class Espresso extends Coffee implements EspressoInterface {
  final double coffee;

  Espresso(this.coffee);

  @override
  makeEspresso() {
    print("Эспрессо готов!");
  }
}

// D — Dependency Inversion (Принцип инверсии зависимостей)
// Для создания напитка Капуччино будет использон соответствующий интерфейс
class Cappuccino extends Espresso implements CappuccinoInterface {
  final double milk;

// L — Liskov Substitution (Принцип подстановки Барбары Лисков)
//
// Для приготовления капуччино мы можем использовать уже готовый Эспрессо, добавив молочную пенку

  Cappuccino(this.milk, coffee) : super(coffee);

  addMilk() {
    print("Добавлено молоко");
  }

  @override
  makeCappuccino() {
    super.makeCoffee();
    addMilk();
    print("Капуччино готов!");
  }
}

// D — Dependency Inversion (Принцип инверсии зависимостей)
// Для создания напитка Гляссе будет использон соответствующий интерфейс
class Glace extends Coffee implements GlaceInterface {
  final double icecream;
  final double coffee;

  Glace(this.icecream, this.coffee);

  // O — Open-Closed (Принцип открытости-закрытости)
  // Переиспользование родительского метода makeCoffee и добавление нового метода addIcecream
  @override
  makeCoffee() {
    super.makeCoffee();
    addIcecream();
  }

  addIcecream() {
    print("Добавлено мороженое");
  }

  @override
  makeGlace() {
    print("Гляссе готов!");
  }
}
