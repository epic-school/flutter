void main(List<String> arguments) {
  final me = Profile(name: 'John', lastName: 'Doe');
  // final meExtended = ExtendedProfile(name: 'John', lastName: 'Doe');
 
  print(me.fullName());
  // print(meExtended.isAdult());

  // print('22'.parseInt());
}

// Наследование
class BaseUser { 
  final String name;
  final String lastName;

  BaseUser({required this.name, required this.lastName});

  String fullName() => '$name $lastName';
}

class Profile extends BaseUser {
  Profile({required String name, required String lastName}) : super(name: name, lastName: lastName);
}


// Миксины
// mixin ExtendedProfileMixin {
//   int age = 18;

//   bool isAdult() {
//     return age > 18;
//   }
// }

// class ExtendedProfile extends Profile with ExtendedProfileMixin {
//   ExtendedProfile({required String name, required String lastName}) : super(name: name, lastName: lastName);
// }

// Exntensions
// extension NumberParsing on String {
//   int parseInt() {
//     return int.parse(this);
//   }
// }
