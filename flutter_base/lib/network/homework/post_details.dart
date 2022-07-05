import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_base/network/api_service.dart';
import 'package:flutter_base/network/enums.dart';
import 'package:flutter_base/network/models/post_model.dart';

class PostDetails extends StatefulWidget {
  final int postId;
  const PostDetails({Key? key, required this.postId}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final ApiService service = ApiServiceDio.instance;
  var state = ContentState.initial;
  late PostModel post;

  Future<void> load() async {
    setState(() {
      state = ContentState.loading;
    });
    final response = await service.getPost(widget.postId);
    if (response.hasError) {
      setState(() {
        state = ContentState.failure;
      });
    } else {
      inspect(response.result);
      setState(() {
        state =
            response.result != null ? ContentState.success : ContentState.empty;
        post = response.result as PostModel;
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
    switch (state) {
      case ContentState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ContentState.success:
        return _PostInfoView(post: post as PostModel);
      case ContentState.failure:
        return const Center(
          child: Text(
            'Ууупс, что-то пошло не так',
            style: TextStyle(color: Colors.red),
          ),
        );
      case ContentState.empty:
        return const Center(
          child: Text('Пустой список постов'),
        );
      default:
        return const Center(
          child: Text('Данные не загружены'),
        );
    }
  }
}

class _PostInfoView extends StatelessWidget {
  final PostModel post;
  const _PostInfoView({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final id = post.id;
    final userId = post.userId;
    final title = post.title;
    final body = post.body;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _TextView(
        label: 'id',
        value: id.toString(),
      ),
      _TextView(
        label: 'userId',
        value: userId.toString(),
      ),
      _TextView(
        label: 'title',
        value: title,
      ),
      _TextView(
        label: 'ibodyd',
        value: body,
      )
    ]);
  }
}

class _TextView extends StatelessWidget {
  final String label;
  final String value;
  const _TextView({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        '${label}: $value',
        style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
