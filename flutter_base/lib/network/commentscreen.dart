import 'package:flutter/material.dart';
import 'package:flutter_base/network/api_service.dart';
import 'package:flutter_base/network/enums.dart';
import 'package:flutter_base/network/models/post_model.dart';

class FullCommentScreen extends StatefulWidget {
  final int id;
  final String postname;

  const FullCommentScreen({
    Key? key,
    required this.id,
    required this.postname,
  }) : super(key: key);

  @override
  State<FullCommentScreen> createState() => _FullCommentScreenState();
}

class _FullCommentScreenState extends State<FullCommentScreen> {
  final ApiService servcomments = ApiServiceImpl.instance;
  var state = ContentState.initial;
  final comments = <CommentModel>[];

  Future<void> load() async {
    setState(() {
      state = ContentState.loading;
    });
    final response = await servcomments.getComments(postID: widget.id);
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
        title: Text(widget.postname),
      ),
      body: _FullcommentView(comments: comments, state: state),
    );
  }
}

class _FullcommentView extends StatelessWidget {
  final List<CommentModel> comments;
  final ContentState state;

  const _FullcommentView(
      {Key? key, required this.comments, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ContentState.success:
        return ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, i) => Column(
            children: [
              Text(
                comments[i].name,
                style: const TextStyle(
                    fontSize: 19, color: Color.fromARGB(255, 7, 98, 255)),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: Text(comments[i].email),
              ),
              Text(comments[i].body),
              const Divider(),
            ],
          ),
        );
      case ContentState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ContentState.empty:
        return const Center(
          child: Text('комментарии к постам отсутствуют'),
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
          child: Text('Данные не загружены!'),
        );
    }
  }
}
