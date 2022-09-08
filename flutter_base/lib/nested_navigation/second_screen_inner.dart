import 'package:flutter/material.dart';

class SecondInnerScreen extends StatelessWidget {
  const SecondInnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("Second inner screen!"),
            Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Go back",
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
