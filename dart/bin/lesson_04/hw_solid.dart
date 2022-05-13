// ignore_for_file: public_member_api_docs, sort_constructors_first
/// Необходимо применить на практике знание ООП и придумать комбинацию классов и интерфейсов
/// которая будет удовлетворять всем правилам SOLID
///
/// Каждое правило вы должны раскрыть с помощью комментария к коду, что оно означает и
/// как вы его применяете конкретно в вашем коде.
///
/// Не запрещено брать примеры из вашего опыта или каких-либо источников, главное написать на Dart
/// и раскрыть суть правил SOLID

/**
 * Single Responsibility Principle    > S <
 * Пример реализации принципа "еденичного поведения" сводится к тому что из класса News выведен
 * в отдельный клас функционал получение данных в нужном формате (в OutputFormat)
 */

class News {
  final String title;
  final String text;
  News({required this.title, required this.text});
}

class OutputFormat {
  final News news;
  OutputFormat({required this.news});

  String json() {
    return '{title: ${this.news.title}, text: ${this.news.text}}';
  }

  String html() {
    return '<div><h2>${this.news.title}</h2><p>${this.news.text}</p></div>';
  }
}

/**
 * Open Close Principle    > O <
 * Пример реализации принципа "открыт для расширения но закрыт для модификации" сводится к тому что
 * благодаря расширению от класса Shape появление новой сущности (расширение класса CalcArea)  не приведёт к необходимости вносить изменения в
 * существующие классы (CalcArea)
 */

abstract class Shape {
  double area();
}

class CalcArea {
  final List<Shape> shapes;

  CalcArea({required this.shapes});

  double sum() {
    return this.shapes.fold<double>(
        0, (previousValue, element) => previousValue + element.area());
  }
}

class Square implements Shape {
  final int size;
  Square({required this.size});
  @override
  double area() {
    return (this.size * this.size).toDouble();
  }
}

class Circle implements Shape {
  final int radius;
  Circle({required this.radius});
  @override
  double area() {
    return (this.radius * this.radius) * 3.14;
  }
}

/**
 * Liskov Substitution Principle    > L <
 * Пример реализации принципа "организации архитектуры при которой подтипы базового класса разделяем на подтипы с своей спецификой" сводится к тому что
 */

class Component {
  final int height;

  Component({required this.height});
}

class SimpleComponent extends Component {
  SimpleComponent({required height}) : super(height: height);
  render() {}
}

class HOC extends Component {
  final Object component;
  HOC({required height, required this.component}) : super(height: height);
  Object get modifiComponent {
    // TODO: implement modification component
    return this.component;
  }
}

class Header extends SimpleComponent {
  Header({required height}) : super(height: height);
  @override
  render() {
    // TODO: implement render
    return super.render();
  }
}

class Footer extends SimpleComponent {
  Footer({required height}) : super(height: height);
  @override
  render() {
    // TODO: implement render
    return super.render();
  }
}

class InputComponent extends HOC {
  InputComponent({required height, required Object component})
      : super(height: height, component: component);
  @override
  Object get modifiComponent {
    // TODO: implement modification component
    return this.component;
  }
}

/**
 * Interface segregation Principle    > I <
 * Пример реализации принципа "разделения интерфейсов" сводится к тому что потомок должен реализовывать все методы родительского класса, 
 * в рамках durt для этого хорошо подходят миксины 
 * Пример: имеются две сущности которые должны реалезовывать несколько одинаковых методов и парочку различных 
 */

class User {
  login() {
    // TODO: implement login
  }
  getRoles() {
    // TODO: implement getRoles
  }
}

abstract class RoleCreatorData {
  creatorData();
}

abstract class RoleReadeData {
  readeData();
}

class Admin extends User with RoleCreatorData, RoleReadeData {
  @override
  creatorData() {
    // TODO: implement creatorData
  }

  @override
  readeData() {
    // TODO: implement readeData
  }
}

class simpleUser extends User with RoleReadeData {
  @override
  readeData() {
    // TODO: implement readeData
  }
}

/**
 * Dependency Inversion Principle  > D <
 * Пример реализации принципа "не зависимости верхнеуровневой реализации от нижней (только зовисимость от обстракций (интерфейса))"
 * Сводится к тому что класс DataBase зовит только от интерфейса Client, инстенс которого прокидывыается в него и мы можем
 * на нижнем уровне варьировать различные реализации Client не затрагивая верхнеуровневую архитектуру приложения
 */

abstract class Client {
  String getData();
}

class FetchClient implements Client {
  @override
  String getData() {
    // TODO: implement getData
    return 'data from fetch';
  }
}

class LocalStorageClient implements Client {
  @override
  String getData() {
    // TODO: implement getData
    return 'data from storage';
  }
}

class DataBase {
  Client client;
  DataBase({
    required this.client,
  });
  String get data {
    return this.client.getData();
  }
}

void main(List<String> args) {
  print('Single Responsibility Principle:');
  var news = News(title: 'example news', text: 'body text for news');
  var newsFormat = OutputFormat(news: news);
  print(newsFormat.json());
  print(newsFormat.html());

  print('Open Close Principle:');
  var calcArea = CalcArea(shapes: [Circle(radius: 2), Square(size: 5)]);
  print(' calcArea.sum = ${calcArea.sum()}');

  print('Dependency Inversion Principle:');
  print(DataBase(client: new FetchClient()).data);
  print(DataBase(client: new LocalStorageClient()).data);
}
