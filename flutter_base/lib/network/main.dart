import 'package:flutter/material.dart';
import 'package:flutter_base/network/api_service.dart';
import 'package:flutter_base/network/enums.dart';
import 'package:flutter_base/network/models/post_model.dart';

import 'models/comment_model.dart';

void main() {
  runApp(const App());
}

final _key = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (ctx) => const PostsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/comments") {
          final data = settings.arguments as PostModel;
          return MaterialPageRoute(builder: (context) {
            return CommentsScreen(
              post: data,
            );
          });
        }
      },
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
        title: const Text('Posts list'),
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
            title: Text(
              posts[i].title,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            subtitle: Text(posts[i].body),
            onTap: () {
              Navigator.pushNamed(
                context,
                "/comments",
                arguments: posts[i],
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

class CommentsScreen extends StatefulWidget {
  final PostModel post;
  const CommentsScreen({Key? key, required this.post}) : super(key: key);

  @override
  State<CommentsScreen> createState() {
    return _CommentsScreenState();
  }
}

class _CommentsScreenState extends State<CommentsScreen> {
  final ApiService service = ApiServiceDio.instance;
  var state = ContentState.initial;
  final comments = <CommentModel>[];

  _CommentsScreenState();

  Future<void> load(int postId) async {
    setState(() {
      state = ContentState.loading;
    });
    final response = await service.getComments(postId: postId);
    if (response.hasError) {
      setState(() {
        state = ContentState.failure;
        comments.clear();
      });
    } else {
      setState(() {
        state = response.result!.isNotEmpty
            ? ContentState.success
            : ContentState.empty;
        comments
          ..clear()
          ..addAll(response.result!);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    load(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: _CommentView(
        state: state,
        comments: comments,
      ),
    );
  }
}

class _CommentView extends StatelessWidget {
  final ContentState state;
  final List<CommentModel> comments;
  const _CommentView({Key? key, required this.comments, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ContentState.success:
        return ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, i) => ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comments[i].name,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                Text(
                  'by ' + comments[i].email,
                  style: const TextStyle(
                      fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ],
            ),
            subtitle: Text(comments[i].body),
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
