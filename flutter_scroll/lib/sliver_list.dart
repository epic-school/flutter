import 'package:flutter/material.dart';

class SliverDemo extends StatelessWidget {
  SliverDemo({Key? key}) : super(key: key);

  final List<String> data = List.generate(1000, (index) => index.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("ListView")),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            // snap: true,
            // floating: true,
            // pinned: true,
            stretch: true,
            expandedHeight: 120,
            title: Text("as"),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  color: Colors.pink[10 * (index % 9 + 1)],
                  child: ListTile(
                    title: Text('Sona$index'),
                  ),
                );
              },
              childCount: 30,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  color: Colors.pink[10 * (index % 9 + 1)],
                  child: ListTile(
                    title: Text('Sona$index'),
                  ),
                );
              },
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
