// 1. Создайте класс Student с final полями firstName, lastName и конструктором const.
// 2. Добавьте в класс конструктор, инициализацию всех свойств.
// 3. Добавьте в класс метод, getter который красиво форматирует Student для печати полей firstName и lastName (должны возвращать с заглавной буквы)
// 4. Переопределите в классе Student метод toString для печати класса

class Student {
  final String firstName;
  final String lastName;

  const Student({required this.firstName, required this.lastName});

  Student.named({this.firstName = "Иван", this.lastName = "Иванов"});

  String get fullName =>
      '${firstName[0].toUpperCase()}${firstName.substring(1)} ${lastName[0].toUpperCase()}${lastName.substring(1)}';
  @override
  String toString() {
    return this.fullName;
  }
}

void main(List<String> arguments) {
  final me = Student(firstName: 'john', lastName: 'doe');
  print(me.fullName);
  print(me.toString());
}
