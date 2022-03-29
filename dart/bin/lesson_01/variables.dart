void main() {
	// var hello = 'Hello, World!';
  // print(hello);

  /////////////////////////////////////////////
  /// Variables
  ///
  // var age = 16;
  // print(age);
  // age = 18;
  // print(age);

  // age = 'string'; // Ошибка, на которую укажет компилятор

  /////////////////////////////////////////////
  /// Final variables
  //
  // final age = 16;
  // final String str = 'string'; // Способ не имеет смысла, так как тип определяется на основе значения
  // age = 18; // Ошибка, на которую укажет компилятор

  /////////////////////////////////////////////
  /// Constants
  // 
  // const age = 16;
  // const String str = 'string'; // Способ не имеет смысла, так как тип определяется на основе значения
  // print(age);
  // age = 18; // Ошибка, на которую укажет компилятор

  /////////////////////////////////////////////
  /// Types
  //
  // final obj = Object();
  // final str = "my string";
  // print (obj);
  // print (obj.runtimeType);
  // print(str);
  // print (str.runtimeType);
  // print(str is Object);

  // num i1 = 12;
  // int i2 = 24;
  // double i3 = 10.0;

  // print(i1 is int);
  // print(i1 is double);
  // print(i2 is num);
  // print(i3 is num);

  /////////////////////////////////////////////
  /// Dynamic
  //
  // var hello;
  // hello = "string";
  // print(hello.runtimeType);
  // print(hello);
  // hello = 82;
  // print(hello.runtimeType);
  // print(hello);
  // print(hello is int);
  // print(hello is String);
  // print(hello is Object);

  /////////////////////////////////////////////
  /// Null safety
  ///
  // String str; 
  // print(str); // компилятор говорит так нельзя...

  /////////
  // final String str; // Ошибка будет сразу здесь...
  // print(str);

  /////////
  // String? str; 
  // print(str); // null

  /////////
  // final String? str = null;
  // print(str);

  /////////
  // String? str; 
  // print(str); // null
  // str = "hello";
  // print(str is String); // false

  /////////
  // final array = <String>[];
  // final String? element;
  // array.add(element); // ошибка

  /////////
  // final array = <String>[];
  // String? element;
  // element = "string";
  // array.add(element!);

  /////////
  // final array = <String>[];
  // final String? element;
  // array.add(element ?? "");
  
  /////////
  // var element; // dynamic
  // print(element); // null
  // element = 1; 
  // print(element); // 1 (int)
}