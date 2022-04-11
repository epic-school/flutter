import 'dart:developer';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: AccessibilityDemo(),
  ));
}

// https://docs.flutter.dev/development/accessibility-and-localization/accessibility

class AccessibilityDemo extends StatelessWidget {
  const AccessibilityDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A11Y'),
      ),
      body: Column(
        children: [
          Semantics(
            button: false,
            child: GestureDetector(
              onTap: () {
                log('tap');
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 20, bottom: 20.0),
                width: double.infinity,
                color: Colors.red,
                child: const Text('Tap me', textAlign: TextAlign.center,),
              ),
            ),
          ),
          Semantics(
            child: ClipOval(
              child: CircleAvatar(
                maxRadius: 60,
                child: Image.network('https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=1200x900&vertical=top'),
              ),
            ),
            label: 'Company logo',
          ),
          // MergeSemantics(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: <Widget>[
          //       ListTile(
          //         leading: const Icon(Icons.account_circle, semanticLabel: 'name'),
          //         title: const Text("John Doe", style: TextStyle(color: Colors.blue),),
          //         onTap: () {},
          //       ),
          //       ListTile(
          //         leading: const Icon(Icons.email, semanticLabel: 'email',),
          //         title: const Text("johndoe@test.com", style: TextStyle(color: Colors.blue),),
          //         onTap: () {},
          //       ),
          //       ListTile(
          //         leading: const Icon(Icons.business, semanticLabel: 'company name'),
          //         title: const Text("ABC Inc.", style: TextStyle(color: Colors.blue),),
          //         onTap: () {},
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
