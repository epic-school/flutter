import 'package:flutter/material.dart';
import 'package:flutter_base/nested_navigation/drawer_screen.dart';
import 'package:flutter_base/nested_navigation/first_screen.dart';
import 'package:flutter_base/nested_navigation/nested_navigation.dart';

import 'second_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  static _TabScreenState? of(BuildContext context) {
    var state = context.findAncestorStateOfType<_TabScreenState>();

    return state;
  }

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;

  final List<GlobalKey<NavigatorState>> _keys = [
      GlobalKey<NavigatorState>(),
      GlobalKey<NavigatorState>()
  ];

  GlobalKey<NavigatorState> get firstTabKey => _keys[0];

  GlobalKey<NavigatorState> get secondTabKey => _keys[1];

  GlobalKey<NavigatorState> get currentNavigator => _keys[_currentIndex];

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () {
                  currentNavigator.currentState?.push(MaterialPageRoute(builder: (context) => const DrawerScreen()));

                  Navigator.of(context).pop();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.5),
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: const Text("Open drawer page"),
                ),
              ),
            )
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Navigator(
            key: firstTabKey,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const FirstTabScreen(),
            ),
          ),
          Navigator(
            key: secondTabKey,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const SecondTabScreen(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: changeTab,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Главная"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Другое"),
        ],
      ),
    );
  }
}
