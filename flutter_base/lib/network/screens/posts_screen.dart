import 'package:flutter/material.dart';
import 'package:flutter_base/network/api_service.dart';
import 'package:flutter_base/network/enums.dart';
import 'package:flutter_base/network/models/post_model.dart';
import 'package:flutter_base/network/screens/detail_post_screen.dart';
import 'package:flutter_base/network/extensions/string_low_up.dart';

class PostsScreen extends StatefulWidget {
  static const routeName = '/posts';

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
        centerTitle: true,
      ),
      body: _PostsView(
        state: state,
        posts: posts,
      ),
    );
  }
}

class _PostsView extends StatefulWidget {
  final ContentState state;
  final List<PostModel> posts;

  const _PostsView({
    Key? key,
    required this.state,
    this.posts = const [],
  }) : super(key: key);

  @override
  State<_PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<_PostsView> {
  void _navigatorAndBookmarkCheck(
      {required BuildContext context, required int index}) async {
    final result = await Navigator.pushNamed(
            context, DetailPostScreen.routeName, arguments: widget.posts[index])
        as bool;
    setState(() {
      widget.posts[index].isBookmark = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.state) {
      case ContentState.success:
        return ListView.builder(
          itemCount: widget.posts.length,
          itemBuilder: (context, i) => ListTile(
            minLeadingWidth: 0.0,
            leading: Stack(children: [
              Container(
                alignment: Alignment.center,
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text(
                  widget.posts[i].title[0].toUpperCase(),
                  style: const TextStyle(
                      fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
              ),
              widget.posts[i].isBookmark
                  ? const Icon(Icons.bookmark, color: Colors.green, size: 20.0)
                  : const SizedBox.shrink(),
            ]),
            title: Container(
              alignment: Alignment.topLeft,
              child: Text(
                '${i + 1}. ${widget.posts[i].title.lowUp()}',
                style: TextStyle(
                    color:
                        widget.posts[i].isViewed ? Colors.blue : Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline),
              ),
            ),
            onTap: () {
              _navigatorAndBookmarkCheck(context: context, index: i);
              setState(() {
                widget.posts[i].isViewed = true;
              });
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
