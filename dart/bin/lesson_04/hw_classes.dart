// 1. Создайте класс Student с final полями firstName, lastName и конструктором const.
// 2. Добавьте в класс конструктор, инициализацию всех свойств.
// 3. Добавьте в класс метод, getter который красиво форматирует Student для печати полей firstName и lastName (должны возвращать с заглавной буквы)
// 4. Переопределите в классе Student метод toString для печати класса
import 'package:strings/strings.dart';
void main(List<String> arguments) {
  Student student = Student();
  student.firstName = 'John';
  student.lastName = 'Wick';
  print(student.toString());
}

class Student{
  final String firstName;
  final String lastName;
  const ToyotaCars(this.firstName, this.lastName);
  String get AllName(String name) => (capitalize(name));

  @override
  String toString() {
    return 'Student{firstName: ${AllName(firstName)}, lastName: ${AllName(lastName)}';
  }

}