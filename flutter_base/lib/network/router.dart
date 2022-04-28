import 'package:flutter/material.dart';
import 'package:flutter_base/network/routes/posts_list.dart';
import 'package:flutter_base/network/routes/single_post.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PostsListScreen.routeName:
        return MaterialPageRoute(builder: (_) => const PostsListScreen());

      case SinglePostScreen.routeName:
        {
          final args = settings.arguments as SinglePostArguments;
          return MaterialPageRoute(builder: (_) => SinglePostScreen(post: args.post));
        }

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
