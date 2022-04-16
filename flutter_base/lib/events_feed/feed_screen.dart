import 'package:flutter/material.dart';

import 'package:flutter_base/events_feed/colors.dart';
import 'package:flutter_base/events_feed/data.dart';
import 'package:flutter_base/events_feed/models.dart';
import 'package:flutter_base/events_feed/partials/common_title.dart';
import 'package:flutter_base/events_feed/partials/birthdays_list.dart';
import 'package:flutter_base/events_feed/partials/news_list.dart';
import 'package:flutter_base/events_feed/partials/events_list.dart';
import 'package:flutter_base/events_feed/partials/skeleton.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Future<AllData> getData() async {
    await Future.delayed(const Duration(seconds: 4));
    return AllData(news: newsList, events: eventList, birthdays: birthdayList);
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
      body: FutureBuilder<AllData>(
        future: getData(),
        builder: (context, snapshot) {
          final birthdays = snapshot.data?.birthdays ?? [];
          final events = snapshot.data?.events ?? [];
          final news = snapshot.data?.news ?? [];

          return !snapshot.hasData
              ? const Skeleton()
              : ListView(
                  shrinkWrap: true,
                  children: [
                    const CommonTitle(title: 'Новости'),
                    NewsList(news: news),
                    const CommonTitle(title: 'Мероприятия'),
                    EventsList(events: events),
                    const CommonTitle(title: 'Дни рождения'),
                    BirthdaysList(birthdays: birthdays),
                    // Extra children for scroll example.
                    const CommonTitle(title: 'Новости'),
                    NewsList(news: news),
                    const CommonTitle(title: 'Мероприятия'),
                    EventsList(events: events),
                    const CommonTitle(title: 'Дни рождения'),
                    BirthdaysList(birthdays: birthdays),
                  ],
                );
        },
      ),
    );
  }
}
