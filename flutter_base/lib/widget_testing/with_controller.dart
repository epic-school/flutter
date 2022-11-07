import 'package:flutter/material.dart';

class SomeController extends ChangeNotifier {
  bool isFetching = false;
  List<String> posts = [];

  SomeController();

  loadItems() async {
    isFetching = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    posts = List.generate(20, (index) => 'Item $index');
    isFetching = false;
    notifyListeners();
    return false;
  }
}

void main() {
  runApp(WidgetWithController(
    ctrl: SomeController(),
  ));
}

class WidgetWithController extends StatelessWidget {
  const WidgetWithController({Key? key, required this.ctrl}) : super(key: key);

  final SomeController ctrl;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: ctrl.loadItems(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Text("Has data");
            } else if (snapshot.hasError) {
              return const Text("Has error");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
