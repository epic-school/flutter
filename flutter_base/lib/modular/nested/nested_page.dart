import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NestedPage extends StatelessWidget {
  const NestedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nested"),),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              Modular.to.navigate('/nested/first-page', arguments: {
                'list': ["A", "B", "C"],
              });
              break;
            case 1:
              Modular.to.navigate('/nested/second-page/4234324', );
              break;
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "First screen",),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Second screen"),
        ],
      ),
      body: RouterOutlet()
    );
  }
}
