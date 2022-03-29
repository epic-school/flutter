class Person {
  final String name;

  Person({required this.name});

  void whoAmI() {
    // const developer = Developer(name: 'Andrey', lang: 'Dart');
    // developer.whoAmI();
  }
}

class Developer {
  final String lang;

  Developer({required this.lang});
}

void main() {
  final person = Person(name: 'Andrey');
  person.whoAmI();
}





// class Person {
//   final String name;
  
//   const Person({required this.name});
  
//   void whoAmI(){
//     print("I'm $name");
//   }
// }

// class Developer extends Person {
//   final String lang;
  
//   const Developer({required String name, required this.lang}) : super(name: name);
  
//   @override
//   void whoAmI(){
//     print("I'm $name and I'm a $lang developer");
//   }
// }