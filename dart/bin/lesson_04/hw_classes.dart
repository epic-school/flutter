// 1. Создайте класс Student с final полями firstName, lastName и конструктором const.
// 2. Добавьте в класс конструктор, инициализацию всех свойств.
// 3. Добавьте в класс метод, getter который красиво форматирует Student для печати полей firstName и lastName (должны возвращать с заглавной буквы)
// 4. Переопределите в классе Student метод toString для печати класса

void main(List<String> arguments) {
  Student student = Student('александр', 'иванов');

  student.toString();
}

class Student {
  final String firstName;
  final String lastName;

  const Student(this.firstName, this.lastName);

  String get fio =>
      "${this.firstName[0].toUpperCase()}${this.firstName.substring(1).toLowerCase()}"
      " ${this.lastName[0].toUpperCase()}${this.lastName.substring(1).toLowerCase()}";

  @override
  String toString() {
    print(fio);
    return fio;
  }
}
