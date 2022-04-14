import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: AutocompleteDemo(),
  ));
}

class User {
  final String email;
  final String fullName;

  User({required this.email, required this.fullName});
}

List<User> usersOptions = [
  User(email: "dmitriy@mail.com", fullName: "Дмитрий"),
  User(email: "danil@mail.com", fullName: "Данил"),
  User(email: "evgeniy@mail.com", fullName: "Евгений"),
  User(email: "gena@mail.com", fullName: "Генадий"),
  User(email: "kiril@mail.com", fullName: "Кирилл"),
  User(email: "makar@mail.com", fullName: "Макар"),
  User(email: "egor@mail.com", fullName: "Егор"),
];

class AutocompleteDemo extends StatelessWidget {
  const AutocompleteDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autocomplete'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Autocomplete<User>(
              displayStringForOption: (User option) => option.email,
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<User>.empty();
                }
                return usersOptions.where((User user) {
                  return user.email
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (User selection) {
                log('Выбран ${selection.fullName}');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            // Autocomplete<User>(
            //   displayStringForOption: (User option) => option.fullName,
            //   fieldViewBuilder: (context, textEditingController, focusNode,
            //       onFieldSubmitted) {
            //     return TextField(
            //       controller: textEditingController,
            //       focusNode: focusNode,
            //       decoration: const InputDecoration(
            //         hintText: 'Поиск по Email',
            //         filled: true,
            //         fillColor: Colors.black12,
            //       ),
            //     );
            //   },
            //   optionsBuilder: (TextEditingValue textEditingValue) {
            //     if (textEditingValue.text == '') {
            //       return const Iterable<User>.empty();
            //     }

            //     return usersOptions
            //         .where((User user) => user.email
            //             .toLowerCase()
            //             .startsWith(textEditingValue.text.toLowerCase()))
            //         .toList();
            //   },
            //   onSelected: (User selection) {
            //     log('Выбран ${selection.fullName}');
            //   },
            //   optionsViewBuilder: (
            //     BuildContext context,
            //     AutocompleteOnSelected<User> onSelected,
            //     Iterable<User> options,
            //   ) {
            //     return Align(
            //       alignment: Alignment.topLeft,
            //       child: Material(
            //         child: Container(
            //           height: 200,
            //           width: 300,
            //           margin: const EdgeInsets.only(top: 10),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: Colors.black26,
            //           ),
            //           child: ListView.builder(
            //             padding: const EdgeInsets.all(10.0),
            //             itemCount: options.length,
            //             itemBuilder: (BuildContext context, int index) {
            //               final User option = options.elementAt(index);
            //               return GestureDetector(
            //                 onTap: () {
            //                   onSelected(option);
            //                 },
            //                 child: ListTile(
            //                   title: Text(
            //                     option.email,
            //                   ),
            //                 ),
            //               );
            //             },
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
