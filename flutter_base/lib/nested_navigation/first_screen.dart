import 'package:flutter/material.dart';
import 'package:flutter_base/nested_navigation/first_screen_inner.dart';
import 'package:flutter_base/nested_navigation/second_screen_inner.dart';
import 'package:flutter_base/nested_navigation/tab_screen.dart';

class FirstTabScreen extends StatelessWidget {
  const FirstTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(child: Text("I am drawer from first screen"),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text("First screen!"),
            Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FirstInnerScreen()));
                },
                child: const Text(
                  "Go to inner screen",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              ),
            ),
            MaterialButton(onPressed: () {
              var tabState = TabScreen.of(context);

              tabState?.changeTab(1);
              tabState?.secondTabKey.currentState?.push(MaterialPageRoute(builder: (context) => const SecondInnerScreen()));

            }, child: const Text("Go to second tab inner screen", style: TextStyle(color: Colors.white),), color: Colors.blue,)
          ],
        ),
      ),
    );
  }
}
