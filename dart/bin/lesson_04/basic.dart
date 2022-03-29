void main(List<String> arguments) {
  // var me = Profile();
  // print(me.fullName());

  // print('Тип: ${me.runtimeType}');
}

// Объявление класса
// class Profile {  
//   String name = "John";
//   String lastName = "Doe";
  
//   // Приватное свойство
//   // int _age = 0;
   
//   String fullName() {
//     return '$name $lastName';
//   }

//   // Приватный метод
//   // int _getAge() {
//   //   return _age;
//   // }
// }


// Объявление класса c конструктором
// class Profile {  
//   final String name;
//   final String lastName;

//   const Profile({ required this.name, required this.lastName });
//   const Profile.admin({ required this.name, required this.lastName });
   
//   String fullName() {
//     return '$name $lastName';
//   }
// }


// Factory
// class Profile {  
//   final String name;
//   final String lastName;
//   final String role;

//   Profile({ required this.name, required this.lastName, this.role = 'user' });

//   factory Profile.admin({ required name, required lastName }) {
//     return Profile(name: name, lastName: lastName, role: 'admin');
//   }
   
//   String fullName() {
//     return '$name $lastName: $role';
//   }
// }

// Статические методы
// class Profile {  
//   final String name;
//   final String lastName;
//   final String _role;

//   const Profile({ required this.name, required this.lastName }): _role = 'user';
//   const Profile.admin({ required this.name, required this.lastName }): _role = 'admin';
   
//   String fullName() {
//     count += 1;
//     return '$name $lastName';
//   }

//   String getRole() {
//     return _role;
//   }

//   static int count = 0;
//   static int staticMethod() {
//     return count;
//   }
// }


// Абстрактный класс
// abstract class User {
//   String fullName();
// }

// class Profile implements User {
//   final String name;
//   final String lastName;

//   Profile({ required this.name, required this.lastName});

//   @override
//   String fullName() {
//     return "$name $lastName";
//   }
// }