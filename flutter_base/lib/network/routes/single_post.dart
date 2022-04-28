import 'package:flutter/material.dart';

import 'package:flutter_base/network/api_service.dart';
import 'package:flutter_base/network/enums.dart';
import 'package:flutter_base/network/models/post_comment_model.dart';
import 'package:flutter_base/network/models/post_model.dart';

class SinglePostScreen extends StatefulWidget {
  static const routeName = '/post';
  final PostModel post;
  const SinglePostScreen({Key? key, required this.post}) : super(key: key);

  @override
  State<SinglePostScreen> createState() => _SinglePostScreenState();
}

class _SinglePostScreenState extends State<SinglePostScreen> {
  final ApiService service = ApiServiceDio.instance;
  var state = ContentState.initial;
  final comments = <PostCommentModel>[];

  Future<void> load() async {
    setState(() {
      state = ContentState.loading;
    });
    final response = await service.getPostComments(widget.post.id);
    if (response.hasError) {
      setState(() {
        state = ContentState.failure;
        comments.clear();
      });
    } else {
      setState(() {
        state = response.result!.isNotEmpty ? ContentState.success : ContentState.empty;
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
        title: Text(widget.post.title),
      ),
      body: _SinglePostView(
        comments: comments,
        post: widget.post,
        state: state,
      ),
    );
  }
}

class _SinglePostView extends StatelessWidget {
  final List<PostCommentModel> comments;
  final PostModel post;
  final ContentState state;

  const _SinglePostView({
    Key? key,
    this.comments = const [],
    required this.post,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ContentState.success:
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, i) {
              if (i == 0) {
                return Column(
                  children: <Widget>[
                    Header(post: post),
                    _CommentItem(
                      comment: comments[i],
                    ),
                  ],
                );
              }
              return _CommentItem(
                comment: comments[i],
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

class _CommentItem extends StatelessWidget {
  const _CommentItem({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final PostCommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: ListTile(
        title: Text('${comment.name} (${comment.email})'),
        subtitle: Text(
          comment.body,
          style: const TextStyle(
            fontSize: 14.0,
            fontStyle: FontStyle.italic,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          side: BorderSide(color: Colors.blue.shade400, width: 2.0),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text('Post:'),
          ),
          Text(
            post.body,
            style: const TextStyle(fontSize: 20),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Text('Comments:'),
          ),
        ],
      ),
    );
  }
}

class SinglePostArguments {
  final PostModel post;

  SinglePostArguments(this.post);
}
