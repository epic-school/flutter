import 'package:flutter/material.dart';
import 'package:flutter_base/network/api_service.dart';
import 'package:flutter_base/network/enums.dart';
import 'package:flutter_base/network/models/post_model.dart';
import 'package:flutter_base/network/models/comment_model.dart';



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
            title: Text(posts[i].title),
            subtitle: Text(posts[i].body),
            onTap: (){
              _key.currentState!.push(
              MaterialPageRoute(
                builder: (context) =>  CommentsScreen(postId: posts[i].id, postTitle:posts[i].title,postBody:posts[i].body),
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


class CommentsScreen extends StatefulWidget {
  final int postId;
  final String postTitle;
  final String postBody;
  const CommentsScreen({Key? key, required this.postId,required this.postTitle,required this.postBody}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final ApiService service = ApiServiceDio.instance;
  var state = ContentState.initial;
  final comments = <CommentModel>[];
  var postBody='';
  var postTitle='';

  Future<void> load() async {
    setState(() {
      state = ContentState.loading;
    });
    final response = await service.getComments(widget.postId);
    postBody=widget.postBody;
    postTitle=widget.postTitle;
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
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post with comments'),
      ),
      body: _CommentsView(
        state: state,
        comments: comments,
        postBody: postBody,
        postTitle: postTitle,
      ),
    );
  }
}

class _CommentsView extends StatelessWidget {
  final ContentState state;
  final List<CommentModel> comments;
  final String postBody;
  final String postTitle;

  const _CommentsView({
    Key? key,
    required this.state,
    this.comments = const [],
    required this.postBody,
    required this.postTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ContentState.success:
        return Padding(padding: const EdgeInsets.all(16.0),
        child:
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(postTitle.toUpperCase(),
                style: const TextStyle(
                  color: Colors.pink,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),),
              Text(postBody,
                style: const TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top:16.0),
              child:
              Text('Комментарии:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),),),
              ...comments.map(
                  (e)=>ListTile(
              title: Text(e.name),
                    subtitle: Text(e.body),
            ),
            )
                .toList(),
            ],
        )
    ),
    );
      case ContentState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ContentState.empty:
        return const Center(
          child: Text('Пустой список комментариев'),
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
