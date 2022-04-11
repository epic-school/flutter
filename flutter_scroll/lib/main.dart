import 'package:flutter/material.dart';

// import 'single_child.dart';
// import 'list_view.dart';
// import 'grid_view.dart';
// import 'page_view.dart';
// import 'reorder_list_view.dart';
// import 'scrollable_sheet.dart';
// import 'scroll_notification.dart';
// import 'nested_scroll.dart';
import 'sliver_list.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: Colors.blue,
      ),
      home: SliverDemo(),
    );
  }
}
