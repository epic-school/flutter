import 'package:flutter/material.dart';
import 'package:flutter_base/network/models/post_model.dart';
import 'package:flutter_base/network/screens/detail_post_screen.dart';
import 'package:flutter_base/network/screens/posts_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PostsScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case PostsScreen.routeName:
            return MaterialPageRoute(
              builder: (context) => const PostsScreen(),
            );

          case DetailPostScreen.routeName:
            final args = settings.arguments as PostModel;
            return MaterialPageRoute(
              builder: (context) => DetailPostScreen(
                postId: args.id,
                title: args.title,
                body: args.body,
                isBookmark: args.isBookmark,
              ),
            );
        }
      },
      //home: PostsScreen(),
    );
  }
}



