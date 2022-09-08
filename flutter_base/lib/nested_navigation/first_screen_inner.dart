import 'package:flutter/material.dart';

class FirstInnerScreen extends StatelessWidget {
  const FirstInnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("First inner screen!"),
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
