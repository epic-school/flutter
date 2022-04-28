import 'package:flutter/material.dart';
import 'package:flutter_base/network/api_service.dart';
import 'package:flutter_base/network/enums.dart';
import 'package:flutter_base/network/models/comment_model.dart';
import 'package:flutter_base/network/extensions/string_low_up.dart';

class DetailPostScreen extends StatefulWidget {
  static const routeName = '/detailPost';

  final int postId;
  final String title;
  final String body;
  final bool isBookmark;

  const DetailPostScreen({
    Key? key,
    required this.postId,
    required this.title,
    required this.body,
    required this.isBookmark,
  }) : super(key: key);

  @override
  State<DetailPostScreen> createState() => _DetailPostScreenState();
}

class _DetailPostScreenState extends State<DetailPostScreen> {
  late bool _isBookmark;

  @override
  void initState() {
    _isBookmark = widget.isBookmark;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, _isBookmark);
          },
        ),
        title: Text(
          widget.title.lowUp(),
          overflow: TextOverflow.fade,
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isBookmark = !_isBookmark;
              });
            },
            icon: const Icon(Icons.bookmark_add),
            color: _isBookmark ? Colors.green : Colors.red,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '\t\t ${widget.body.lowUp().replaceAll('\n', '')}',
              style: const TextStyle(
                fontSize: 24.0,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 16.0,
            ),
            _CommentsView(postId: widget.postId),
          ],
        ),
      ),
    );
  }
}

class _CommentsView extends StatefulWidget {
  final int postId;

  const _CommentsView({Key? key, required this.postId}) : super(key: key);

  @override
  State<_CommentsView> createState() => _CommentsViewState();
}

class _CommentsViewState extends State<_CommentsView> {
  final ApiService service = ApiServiceDio.instance;
  var state = ContentState.initial;
  final comments = <CommentModel>[];

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
    load(widget.postId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ContentState.success:
        return Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Комментарии',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      comments.length.toString(),
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        childrenPadding: const EdgeInsets.only(bottom: 8.0),
                        title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Тема: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Text(
                                  comments[index].name.lowUp(),
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ]),
                        subtitle: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Автор: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: Text(
                                  comments[index].email,
                                  style: const TextStyle(
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ]),
                        children: [
                          Text(
                            '\t\t ${comments[index].body.lowUp().replaceAll('\n', '')}',
                            textAlign: TextAlign.justify,
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        );
      case ContentState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ContentState.empty:
        return const Center(
          child: Text('Комментариев нет'),
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
