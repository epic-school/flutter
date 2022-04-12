import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SliverDemo(),
  ));
}

class SliverDemo extends StatelessWidget {
  SliverDemo({Key? key}) : super(key: key);

  final List<String> data = List.generate(1000, (index) => index.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("ListView")),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220.0,
            pinned: true,
            floating: true,
            // snap: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text('Title',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              background: Image.network(
                'https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                fit: BoxFit.cover,
              ),
            ),
          ),


          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  color: Colors.pink[10 * (index % 9 + 1)],
                  child: ListTile(
                    title: Text('Content $index'),
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
                    title: Text('Content in grid $index'),
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
