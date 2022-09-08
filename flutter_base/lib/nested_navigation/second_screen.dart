import 'package:flutter/material.dart';
import 'package:flutter_base/nested_navigation/second_screen_inner.dart';

class SecondTabScreen extends StatelessWidget {
  const SecondTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("Second screen!"),
            Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SecondInnerScreen()));
                },
                child: const Text(
                  "Go to inner screen",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}