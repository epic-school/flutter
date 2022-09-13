import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ExampleUI(),));
}

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

class _AppMenu extends StatelessWidget {
  const _AppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Header'),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
          ),
          title: Text('Page 1'),
        ),
        ListTile(
          leading: Icon(
            Icons.exit_to_app,
          ),
          title: Text('Page 2'),
        ),
      ],
    );
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
      drawer: const Drawer(
        child: _AppMenu(),
      ),
    );
  }
}


class _TabletLayout extends StatelessWidget {
  const _TabletLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("This is tablet"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Page 1",),
              Tab(icon: Icon(Icons.exit_to_app), text: "Page 2",),
              Tab(icon: Icon(Icons.home), text: "Page 1",),
              Tab(icon: Icon(Icons.exit_to_app), text: "Page 2",),
              Tab(icon: Icon(Icons.home), text: "Page 1",),
              Tab(icon: Icon(Icons.exit_to_app), text: "Page 2",),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.home),
            Icon(Icons.exit_to_app),
            Icon(Icons.home),
            Icon(Icons.exit_to_app),
            Icon(Icons.home),
            Icon(Icons.exit_to_app),
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
    return const Scaffold(
      body: Drawer(
        elevation: 0,
        width: 420,
        child: _AppMenu(),
      ),
    );
  }
}
