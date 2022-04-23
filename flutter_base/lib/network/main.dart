import 'package:flutter/material.dart';
import 'package:flutter_base/network/api_service.dart';
import 'package:flutter_base/network/enums.dart';
import 'package:flutter_base/network/models/comment_model.dart';
import 'package:flutter_base/network/models/post_model.dart';

void main() {
  runApp(const App());
}

final _key = GlobalKey<NavigatorState>();


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _key,
      debugShowCheckedModeBanner: false,
      home: const PostsScreen(),
    );
  }
}


class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final ApiService service = ApiServiceDio.instance;
  var state = ContentState.initial;
  final posts = <PostModel>[];

  Future<void> load() async {
    setState(() {
      state = ContentState.loading;
    });
    final response = await service.getPosts();
    if (response.hasError) {
      setState(() {
        state = ContentState.failure;
        posts.clear();
      });
    } else {
      setState(() {
        state = response.result!.isNotEmpty
            ? ContentState.success
            : ContentState.empty;
        posts
          ..clear()
          ..addAll(response.result!);
      });
    }
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
      ),
      body: _PostsView(
        state: state,
        posts: posts,
      ),
    );
  }
}

class _PostsView extends StatelessWidget {
  final ContentState state;
  final List<PostModel> posts;

  const _PostsView({
    Key? key,
    required this.state,
    this.posts = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ContentState.success:
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, i) => ListTile(
            title: Text(posts[i].title),
            subtitle: Text(posts[i].body),
            onTap:  () {
              _key.currentState!.push(
                MaterialPageRoute(
                  builder: (context) =>   CommentScreen(postId: posts[i].id),
                ),
              );
            },
          ),
          );

      case ContentState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ContentState.empty:
        return const Center(
          child: Text('Пустой список постов'),
        );
      case ContentState.failure:
        return const Center(
          child: Text(
            'Ууупс, что-то пошло не так',
            style: TextStyle(color: Colors.red),
          ),
        );
      default:
        return const Center(
          child: Text('Данные не загружены'),
        );
    }
  }
}

//

class CommentScreen extends StatefulWidget {
  final int postId;
  const CommentScreen({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentScreen> createState() =>  _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {


  final ApiService service = ApiServiceDio.instance;
  var state = CommentState.initial;
  final comments = <CommentModel>[];


  Future<void> load() async {
    setState(() {
      state = CommentState.loading;
    });
    // изменить

    final response = await service.getComments(widget.postId);
    if (response.hasError) {
      setState(() {
        state = CommentState.failure;
        comments.clear();
      });
    } else {
      setState(() {
        state = response.result!.isNotEmpty
            ? CommentState.success
            : CommentState.empty;
        comments
          ..clear()
          ..addAll(response.result!);
      });
    }
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments List'),
      ),
      body: _CommentsView(
        state: state,
        comments: comments,
      ),
    );
  }
}

class _CommentsView extends StatelessWidget {
  final CommentState state;
  final List<CommentModel> comments;

  const _CommentsView({
    Key? key,
    required this.state,
    this.comments = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case CommentState.success:
        return ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, i) => ListTile(
            title: Text(comments[i].name),
            subtitle: Text(comments[i].body),
          ),
        );
      case CommentState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case CommentState.empty:
        return const Center(
          child: Text('Пустой список комментариев'),
        );
      case CommentState.failure:
        return const Center(
          child: Text(
            'Ууупс, что-то пошло не так',
            style: TextStyle(color: Colors.red),
          ),
        );
      default:
        return const Center(
          child: Text('Комментарии не загружены'),
        );
    }
  }
}