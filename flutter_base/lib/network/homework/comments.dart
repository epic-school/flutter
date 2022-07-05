import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/network/api_service.dart';
import 'package:flutter_base/network/enums.dart';
import 'package:flutter_base/network/models/comment_model.dart';

class Comments extends StatefulWidget {
  final int postId;
  const Comments({Key? key, required this.postId}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final ApiService service = ApiServiceDio.instance;
  var state = ContentState.initial;
  final comments = <CommentModel>[];

  Future<void> load() async {
    setState(() {
      state = ContentState.loading;
    });
    final response = await service.getComments(widget.postId);
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
    return Column(children: [
      Container(
        height: 20,
        child: Text('Комментарии'),
      ),
      Flexible(
          child: _CommentsView(
        state: state,
        comments: comments,
      )),
    ]);
  }
}

class _CommentsView extends StatelessWidget {
  final ContentState state;
  final List<CommentModel> comments;
  const _CommentsView({Key? key, required this.state, this.comments = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ContentState.success:
        return ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, i) => ListTile(
            title: Text(comments[i].name),
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
