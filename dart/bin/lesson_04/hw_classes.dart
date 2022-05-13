// 1. Создайте класс Student с final полями firstName, lastName и конструктором const.
// 2. Добавьте в класс конструктор, инициализацию всех свойств.
// 3. Добавьте в класс метод, getter который красиво форматирует Student для печати полей firstName и lastName (должны возвращать с заглавной буквы)
// 4. Переопределите в классе Student метод toString для печати класса

void main(List<String> arguments) {
  
}

class Student {
  final String firstName;
  final String lastName;

  const Student({required this.firstName, required this.lastName});

  String get fullName => '${firstName.capitalize()} ${lastName.capitalize()}';

  @override
  String toString() {
    return fullName;
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
