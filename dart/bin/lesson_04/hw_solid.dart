/// Необходимо применить на практике знание ООП и придумать комбинацию классов и интерфейсов
/// которая будет удовлетворять всем правилам SOLID
///
/// Каждое правило вы должны раскрыть с помощью комментария к коду, что оно означает и
/// как вы его применяете конкретно в вашем коде.
///
/// Не запрещено брать примеры из вашего опыта или каких-либо источников, главное написать на Dart
/// и раскрыть суть правил SOLID
///
///

// Все, что ниже очень притянуто за уши и до конца понимания нет. При отсутствии боевого опыта
// сложновато что-то сочинить или правильно показать на чужом коде

// SRP. Принцип единственной ответственности.
// Разделяем на отдельные классы конкретные задачи
// Отвечает только за товар
class Product {
  String brand;
  Product({
    required this.brand,
  });

  void getBrand() {
    print('Марка Товара: ${this.brand}');
  }
}

// Отвечает только за корзину
class Cart {
  void addProductToCart() {}
  void delProductFromCart() {}
  void refreshCart() {}
}

// Отвечает только за заказ
class Order {}

// OCP. Прицип открытости для расширения и закрытости для изменения.
// Наследуем классы и расширяем функционал не внося
// изменения в родительский класс
class Food extends Product {
  Food({required String brand}) : super(brand: brand);

  //Расширили функционал
  void canEat() {
    print('Это еда. Ее можно есть!');
  }

  @override
  void getBrand() {
    print('Марка Еды: ${this.brand}');
  }
}

class Alcohol extends Product {
  Alcohol({required String brand}) : super(brand: brand);

  //Расширили функционал
  void canDrink() {
    print('Это алкоголь. Его можно пить! Чуть-чуть');
  }

  @override
  void getBrand() {
    print('Марка Алкоголя: ${this.brand}');
  }
}

// LSP. Принцип подстановки подклассов для замены своих суперклассов. Т.е., если есть
// некий метод принимающий в качестве аргумента значение с типом суперкласса, то он также
// должен работать и со значением с типом подкласса.
// Передав в эту функцию объект подкласса или суперкласса код должен отработать верно

void printBrand(Product product) {
  product.getBrand();
}

// ISP. Принцип разделения интерфейсов говорит о том, что интерфейсы должны быть
// ускоспециализированные. Допустим мы хотим добавить возможность применять скидки
// к товарам в корзине и есть два типа клиентов обычный 10% и VIP 20%
// Например, для этого создадим отдельные классы корзин и интерфейс скидок
// abstract class Discount {
//   customerDiscount() {}
//   vipCustomerDiscount() {}
// }
// Так будет не правильно потому что в таком случае все методы надо будет описать в каждом
// имплементируемом классе и они будут доступны там где их быть недолжно. Необходимо разделить
// интерфейс
abstract class Discount {
  void customerDiscount() {}
}

abstract class VipDiscount {
  void vipCustomerDiscount() {}
}

class CustomerCart extends Cart implements Discount {
  @override
  void customerDiscount() {
    print('Применена скидка 10%');
  }
}

class VipCustomerCart extends Cart implements VipDiscount {
  @override
  void vipCustomerDiscount() {
    print('Применена VIP скидка 20%');
  }
}
//DIP. Инверсия зависимостей, говорит о том, что сущности должны зависеть от
// абстракций, а не реализации. Например, необходимо наши заказы сохранять в БД
// и для этого создадим интерфейс подключения к БД.

abstract class DBConnection {
  void connect();
}

// и класс для каждого типа подключения. Например,
class MySQLConnection implements DBConnection {
  @override
  void connect() {}
}

class FirebaseConnection implements DBConnection {
  @override
  void connect() {}
}

// и для сохранения заказов создадим класс, который зависит от абстракции,
// а не от конкретной реализации
class SaveToDB {
  final DBConnection dbConnection;

  SaveToDB(this.dbConnection);
}

void main(List<String> args) {
  final product = Product(brand: 'Product');
  final food = Food(brand: 'Food');
  final alcohol = Alcohol(brand: 'Alcohol');

  printBrand(product);
  printBrand(food);
  printBrand(alcohol);
}
