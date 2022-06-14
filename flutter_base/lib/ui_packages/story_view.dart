import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:story_view/story_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Story> _stories = [
    Story(
        authorName: "John",
        authorLastName: "Doe",
        publishedDate: "40 minutes ago",
        imageUrl:
            "https://funart.pro/uploads/posts/2021-03/1617071988_21-p-oboi-ozero-peito-23.jpg"),
    Story(
        authorName: "Ivan",
        authorLastName: "Ivanov",
        publishedDate: "1 hour ago",
        imageUrl:
            "https://traveltimes.ru/wp-content/uploads/2021/10/1506507528179_1852790_1440x960_1506507529424.jpg"),
    Story(
        authorName: "Andrew",
        authorLastName: "Brown",
        publishedDate: "2 hours ago",
        imageUrl:
            "https://elitehongkongtravel.ru/assets/images/2015/various/macau-skyline.1910x1000.jpg"),
  ];

  final StoryController _storyController = StoryController();

  late final List<StoryItem> _storyItems = _stories
      .map((e) =>
          StoryItem.pageImage(url: e.imageUrl, controller: _storyController))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Shimmer.fromColors(
                baseColor: Color(0xFFD9D9D9),
                highlightColor: Colors.white54,
                period: Duration(seconds: 2),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Container(
                        width: 64,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Container(
                            width: 250,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Container(
                            width: 80,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoryPage extends StatefulWidget {
  final List<StoryItem> storyItems;
  final StoryController controller;

  const _StoryPage(
      {Key? key, required this.storyItems, required this.controller})
      : super(key: key);

  @override
  State<_StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<_StoryPage> {
  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: widget.storyItems,
      controller: widget.controller,
      onComplete: () => Navigator.of(context).pop(),
    );
  }
}

class Story {
  final String authorName;
  final String authorLastName;
  final String publishedDate;
  final String imageUrl;

  Story({
    required this.authorName,
    required this.authorLastName,
    required this.publishedDate,
    required this.imageUrl,
  });
}
