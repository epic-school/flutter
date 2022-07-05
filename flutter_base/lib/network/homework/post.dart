import 'package:flutter/material.dart';
import 'package:flutter_base/network/homework/comments.dart';
import 'package:flutter_base/network/homework/post_details.dart';

class Post extends StatelessWidget {
  final int postId;
  const Post({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post info $postId'),
      ),
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        // Flexible(
        //     child: SizedBox(
        //         width: double.infinity,
        //         child: DecoratedBox(
        //           decoration: const BoxDecoration(
        //               color: Color.fromARGB(255, 86, 92, 102)),
        //           child: Padding(
        //               padding: const EdgeInsets.all(10),
        //               child: PostDetails(postId: postId)),
        //         ))),
        // Flexible(
        //     child: SizedBox(
        //         width: double.infinity,
        //         height: double.infinity,
        //         child: DecoratedBox(
        //             decoration: const BoxDecoration(
        //                 color: Color.fromARGB(255, 171, 189, 221)),
        //             child: Comments(
        //               postId: postId,
        //             )))),
        Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 86, 92, 102)),
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: PostDetails(postId: postId)),
        ),
        Flexible(
            child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 200, 203, 207)),
                child: Comments(
                  postId: postId,
                ))),
      ]),
    );
  }
}
