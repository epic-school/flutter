import 'package:flutter/material.dart';

import 'package:flutter_base/network/router.dart' as app_router;
import 'package:flutter_base/network/routes/posts_list.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: app_router.Router.generateRoute,
      initialRoute: PostsListScreen.routeName,
    );
  }
}
