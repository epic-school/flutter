/// Необходимо применить на практике знание ООП и придумать комбинацию классов и интерфейсов
/// которая будет удовлетворять всем правилам SOLID
///
/// Каждое правило вы должны раскрыть с помощью комментария к коду, что оно означает и
/// как вы его применяете конкретно в вашем коде.
///
/// Не запрещено брать примеры из вашего опыта или каких-либо источников, главное написать на Dart
/// и раскрыть суть правил SOLID

// Single responsibility
// Каждый класс у нас имеет одно предназначение и у него одна зона ответственности, User отвечает за сущность юзера и хранит
// информацию о нём, но методы получения и изменения информации о нём мы реализуем в отдельном классе UserRepository который
// отвечает за обработку данных пользователя.Таким образом мы не создаём один класс на 1000 строк, так как в дальнейшем
// свойства и метода класса могут расти, так же если у нас появятся источники получения данных, то для этого тоже нужно создавать
// отдельный класс отвечающий за получение данных

class User {
  String name;
  String lastName;
  int age;

  User({required this.name, required this.lastName, required this.age});
}

class UserRepository {
  User user;

  UserRepository({required this.user});

  String getUserInformation() {
    return "${user.name} ${user.lastName} ${user.age}";
  }

  void putUserInformation(String name, String lastName, int age) {
    user.name = name;
    user.lastName = lastName;
    user.age = age;
  }
}

// Open/Closed

// У нас есть класс Image в котором мы реализовали метод сохранения картинки

class Image {
  void SaveImageInPNG() {
    print('Do saving image in png');
  }
}

// далее в какой-то момент времени нам понадобилось сохранять данный файл так же в формат jpeg
// менять старый метод мы не можем, так как он оттестирован и используется в коде всей программы разными разработчиками
// в данном случае нужно было на этапе проектирования заложить возможность расширения функционала класса без изменения уже написанного кода
abstract class Save {
  save();
}

class PngImage implements Save {
  @override
  void save() {
    print('Do saving image in png');
  }
}

class JpegImage implements Save {
  @override
  void save() {
    print('Do saving image in jpeg');
  }
}

// L - Принцип подстановки барбары лисков
// Наследуемый класс должен дополнять, а не заменять поведение базового класа.При таком подходе при подстановке наследника в коде где использовался базовый
// класс код должен продолжить работать как и прежде.

class Animal {
  void walk(var legs) {
    print('$this walk by using $legs legs');
  }
}

class Bird extends Animal {
  @override
  void walk(legs) {
    int wings = legs;
    if (wings > 2) wings = 2;
    print('birds has $wings wings to fly');
  }
}

class Cat extends Bird {}

// В данном случае в классе Bird мы переопределии метод walk таким образом, что он полностью изменил
// изначальный функционал этого метода
// и теперь в случае если мы наследуем Cat не от Animal, а от Bird, наш метод для кота работает уже некорректно
void main() {
  Bird bird = Bird();
  Cat cat = Cat();

  bird.walk(2);
  cat.walk(4);
}

//Interface Segregation
// Например у нас есть интерфейс Weapon и в нём есть два метода аьаковаьб и перезаряжать

abstract class Weapon {
  void attack() {}

  void reload() {}
}

// При реализации интерфейса с пистолетом, всё ок

class Pistol implements Weapon {
  @override
  void attack() {
    print('Стрелять');
  }

  @override
  void reload() {
    print('Перезарядить пистолет');
  }
}

//Но когда мы попробууем реализовать Weapon с ножом, нам придётся переопределить метод reload, хотя для ножа он нам не нужен

class Knife implements Weapon {
  @override
  void attack() {
    print('Атаковать');
  }

  @override
  void reload() {
    // Нож не может перезаряжаться
  }
}

//  данном случае нам нужно разбить наш интерфейс на две отдельных, один будет отвечать за атаку, второй за перезарядку


// D - ринцип инверсии зависимостей


// В данном случае чтобы использовать класс А в классе В мы создали зависимость одного класса от другого создав экземпляр внутри класса

class A {
  void a () {}
}

class B {
  A a = A();

  void b () {
    a.a();
  }
}

// а вот тут мы передаём объект класса уже в конструкторе, таким образом мы будем давать классу С объект класса А только тогда, когда будем создавать его объект
// так же для реализации этого принципа можно использовать абстракции в виде интерфейсов

class C {
  A a;
 C(this.a);

 void c () {
   a.a();
 }
}