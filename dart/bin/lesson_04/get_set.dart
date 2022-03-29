void main(List<String> arguments) {
  var me = Profile(birthDate: DateTime(2020), name: 'John');
  // me.age = 1;
  print(me.isAdult);
}

/// Геттеры и сеттеры
class Profile { 
  final String name;
  DateTime birthDate;

  Profile({ required this.name, required this.birthDate });

  bool get isAdult => (DateTime.now().year - birthDate.year) > 18;

  set age(int val) => birthDate = DateTime((DateTime.now().year - val));
}  
