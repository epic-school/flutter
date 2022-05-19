import 'package:flutter_base/events_feed/elements/Berthdays.dart';
import 'package:flutter_base/events_feed/elements/News.dart';
import 'package:flutter_base/events_feed/elements/Events.dart';
import 'package:flutter_base/events_feed/elements/RowEvents.dart';

import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/colors.dart';
import 'package:flutter_base/events_feed/data.dart';
import 'package:flutter_base/events_feed/models.dart';

const styleEvents = TextStyle(
  color: AppColors.color,
  fontSize: 14.0,
);

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Future<AllData> getData() async {
    await Future.delayed(const Duration(seconds: 4));
    return AllData(news: newsList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Лента событий',
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        toolbarHeight: 52.0,
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          bool isShimmer = !snapshot.hasData;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowEvents(
                  title: 'Новости', items: News(isShimmer), height: 256.0),
              RowEvents(
                  title: 'Мероприятия',
                  items: Events(isShimmer),
                  height: 152.0),
              RowEvents(
                  title: 'Дни рождения',
                  items: Berthdays(isShimmer),
                  height: 96.0),
            ],
          );
        },
      )),
    );
  }
}
