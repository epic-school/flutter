import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ExampleUI(),));
}

class MenuItem {
  final String text;
  final IconData icon;

  MenuItem({ required this.text, required this.icon });
}

final menuItems = [
  MenuItem(text: "Home page", icon: Icons.home),
  MenuItem(text: "Catalog", icon: Icons.list),
];
final content = List.generate(40, (index) => "Item: $index");


class ExampleUI extends StatelessWidget {
  const ExampleUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return const _MobileLayout();
      } else if (constraints.maxWidth < 1100) {
        return const _TabletLayout();
      } else {
        return const _DesktopLayout();
      }
    });
  }
}


class _MobileLayout extends StatelessWidget {
  const _MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is mobile"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ...content.map((e) => Container(
            margin: const EdgeInsets.all(6),
            color: Colors.red,
            child: Center(child: Text(e),),
          )).toList()
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Header'),
            ),
            ...menuItems.map((e) => ListTile(
              leading: Icon(
                  e.icon
              ),
              title: Text(e.text),
            )).toList(),
          ],
        ),
      ),
    );
  }
}


class _TabletLayout extends StatelessWidget {
  const _TabletLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("This is tablet"),
          bottom: TabBar(
            tabs: menuItems.map((e) => Tab(text: e.text, icon: Icon(e.icon),)).toList(),
          ),
        ),
        body: TabBarView(
          children: [
            GridView.count(
              crossAxisCount: 4,
              children: [
                ...content.map((e) => Container(
                  margin: const EdgeInsets.all(6),
                  color: Colors.red,
                  child: Center(child: Text(e),),
                )).toList()
              ],
            ),
            const Icon(Icons.exit_to_app),
          ],
        ),
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gridLength = MediaQuery.of(context).size.width > 1800 ? 6 : 4;

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 440,
            height: double.infinity,
            color: Colors.black12,
            child: ListView(
              children: menuItems.map((e) => ListTile(
                leading: Icon(e.icon),
                title: Text(e.text),
              )).toList(),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: gridLength,
              children: [
                ...content.map((e) => Container(
                  margin: const EdgeInsets.all(6),
                  color: Colors.red,
                  child: Center(child: Text(e),),
                )).toList()
              ],
            ),
          )
        ],
      ),
    );
  }
}
