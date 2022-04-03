/// Необходимо применить на практике знание ООП и придумать комбинацию классов и интерфейсов
/// которая будет удовлетворять всем правилам SOLID
/// 
/// Каждое правило вы должны раскрыть с помощью комментария к коду, что оно означает и
/// как вы его применяете конкретно в вашем коде.
/// 
/// Не запрещено брать примеры из вашего опыта или каких-либо источников, главное написать на Dart
/// и раскрыть суть правил SOLID
/// 
//    S: Single Responsibility Principle (Принцип единственной ответственности).
//    O: Open-Closed Principle (Принцип открытости-закрытости).
//    L: Liskov Substitution Principle (Принцип подстановки Барбары Лисков).
//    I: Interface Segregation Principle (Принцип разделения интерфейса).
//    D: Dependency Inversion Principle (Принцип инверсии зависимостей).

const List<String> nameTeam = ['dynamo', 'ska', 'avangard', 'grom'];

abstract class Hockeist {
  final String nameTeam;
  final String name;
  int numberPlayer;
  Hockeist(this.name, this.numberPlayer, this.nameTeam);
/*
  описание методов в общем классе Hockeist позволяет реализовать одновременно 
  реализовать несколько SOLID, а именно: 
    Добавление новых общих методов для дааного класса позволяет избежать 
    вмешвтельства в дочерние классы реализовав прицип 'S' + за счет того, что
    методы описанные с суперклассе используются дочерними, то отпадает необходимость
    редактировать дочерние классы изменяя и добавляя основной только класс не
    изменяя дочерние, тем самым обспечивается принцип 'O'    
*/
  showPerson() {
    print("Name: $nameTeam $name $numberPlayer $nameTeam");
  }

  set newNubmer(int val) => this.numberPlayer = val;
}

/*
  В случае описания в одном миксине всех доступных свойств игрока, нарушился бы
  прицип 'L' поскольку метод saving не может использоваться никем кроме объектов
  класса Keeper, а методы attack и playing могут использоваться объектами 
  Defensemen и Forward, поэтому разделив эти функции в отдельные миксины мы
  избежали возможные нарушения принципа 'L' так как использвать функции смогут
  только объекты классов для которых они предназначены изначально
  здесь же реализуется и прицип 'I', но о нем напиу ниже
*/
mixin playerFunction {
  void attack(name) {
    print('$name is scores goals');
  }

  void playng() {
    print('this player score a goal');
  }
}
mixin keeperFunction {
  void saivng(name) {
    print('$name is protected a goal');
  }
}

/* 
  выделение игроков в дочерние классы по ампула (Forward Keeper Defensemen) 
  позволяет реализовать принцип 'S' поксольу эти классы отвечают только за 
  реализацию конкретных объектов. Разделение на отдельные классы позволяет
  разделить и обязанности между разработчиками по их редактированию 
  в случае необходимости. Одновременно выделение игроков в отдельные классы
  позволило обеспечить выполнение и принципа 'I' так как при помощи использования
  наследования и миксинов были заранее разделены интефейсы
*/
class Forward extends Hockeist with playerFunction {
  Forward(String name, int numberPlayer, String nameTeam)
      : super(name, numberPlayer, nameTeam);
}

class Keeper extends Hockeist with keeperFunction {
  Keeper(String name, int numberPlayer, String nameTeam)
      : super(name, numberPlayer, nameTeam);
}

class Defensemen extends Hockeist with playerFunction implements form {
  Defensemen(String name, int numberPlayer, String nameTeam)
      : super(name, numberPlayer, nameTeam);

  @override
  void bandy() {
    print('bandry special for Defensemen');
  }

  @override
  void helmet() {
    print('helmet special for Defensemen');
  }

  @override
  void skates() {
    print('skates special for Defensemen');
  }
}
/*
  принцип "D" реализуем за счет создания абстрации form не привязываясь к 
  конкретному классу описав в ней общие данные, а интерфейс непосредственно 
  опишем для класса Defensemen
*/
abstract class form {
  void helmet() {}
  void skates() {}
  void bandy() {}
}

void main(List<String> arguments) {
  var malkin = Forward('malkin', 18, nameTeam[2]);
  var bob = Keeper('dds', 18, nameTeam[3]);
  malkin.newNubmer = 0;
  malkin.attack(malkin.name);
  malkin.playng();
  malkin.showPerson();
}
