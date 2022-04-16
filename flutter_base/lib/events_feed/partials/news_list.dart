import 'package:flutter/material.dart';

import 'package:flutter_base/events_feed/models.dart';
import 'package:flutter_base/events_feed/partials/news_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    Key? key,
    required this.news,
  }) : super(key: key);

  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 266.0,
      padding: const EdgeInsets.only(left: 12.0, bottom: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 300.0,
            child: NewsItem(
              item: news[index],
            ),
          );
        },
      ),
    );
  }
}
