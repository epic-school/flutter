import 'package:flutter/material.dart';

import 'package:flutter_base/network/api_service.dart';
import 'package:flutter_base/network/enums.dart';
import 'package:flutter_base/network/models/post_model.dart';
import 'package:flutter_base/network/routes/single_post.dart';

class PostsListScreen extends StatefulWidget {
  static const routeName = '/';

  const PostsListScreen({Key? key}) : super(key: key);

  @override
  State<PostsListScreen> createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
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
        state = response.result!.isNotEmpty ? ContentState.success : ContentState.empty;
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
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, i) => ListTile(
              title: Text(posts[i].title),
              subtitle: Text(posts[i].body),
              onTap: () => Navigator.pushNamed(
                context,
                '/post',
                arguments: SinglePostArguments(posts[i]),
              ),
            ),
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
