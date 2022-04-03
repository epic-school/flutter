// 1. Создайте класс Student с final полями firstName, lastName и конструктором const.
// 2. Добавьте в класс конструктор, инициализацию всех свойств.
// 3. Добавьте в класс метод, getter который красиво форматирует Student для печати полей firstName и lastName (должны возвращать с заглавной буквы)
// 4. Переопределите в классе Student метод toString для печати класса

class Student {
  final String firstName;
  final String lastName;

  const Student(this.firstName, this.lastName);
  Student.named({ required this.firstName, required this.lastName });

  String get fullName =>
      '${_getFromUpperCase(firstName)} ${_getFromUpperCase(lastName)}';


  @override
  String toString() {
    return fullName;
  }

  String _getFromUpperCase(String str) => '${str[0].toUpperCase()}${str.substring(1)}';
}

void main(List<String> arguments) {
  Student student1 = Student('ivan', 'ivanov');
  print(student1.fullName);
  print(student1);
}
