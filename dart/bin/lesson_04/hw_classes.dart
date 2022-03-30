// 1. Создайте класс Student с final полями firstName, lastName и конструктором const.
// 2. Добавьте в класс конструктор, инициализацию всех свойств.
// 3. Добавьте в класс метод, getter который красиво форматирует Student для печати полей firstName и lastName (должны возвращать с заглавной буквы)
// 4. Переопределите в классе Student метод toString для печати класса

class Student {
  final String firstName;
  final String lastName;

  const Student({required this.firstName, required this.lastName});

  Student.named({this.firstName = 'имя', this.lastName = 'рек'});

  String get fullName => firstName.isEmpty
      ? 'First name is empty'
      : lastName.isEmpty
          ? 'Last name is empty'
          : 'Имя: ${_lowUp(firstName)} \nФамилия: ${_lowUp(lastName)}';

  String _lowUp(String str) =>
      str.toLowerCase().replaceRange(0, 1, str[0].toUpperCase());

  @override
  String toString() {
    return this.fullName;
  }
}

void main(List<String> arguments) {
  final student = Student(firstName: 'aleXEy', lastName: 'pereVerZev');
  final student2 = Student.named();

  print(student.fullName);
  print(student2);
}
