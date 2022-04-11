import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/models.dart';
import 'package:flutter_base/events_feed/widgets/birthdays_item.dart';
import 'package:flutter_base/events_feed/widgets/events_item.dart';
import 'package:flutter_base/events_feed/widgets/news_item.dart';
import 'package:flutter_base/events_feed/widgets/title_item.dart';

class FeedsView extends StatelessWidget {
  final BuildContext context;
  final AsyncSnapshot<AllData> snapshot;

  const FeedsView({
    Key? key,
    required this.context,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleItem(title: 'Новости'),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: SizedBox(
            height: 256.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.news.length,
                itemBuilder: (context, index) {
                  final news = snapshot.data!.news[index];
                  return NewsItem(
                    title: news.title,
                    date: news.date,
                  );
                }),
          ),
        ),
        const TitleItem(title: 'Мероприятия'),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: SizedBox(
            height: 152.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.news.length,
                itemBuilder: (context, index) {
                  final event = snapshot.data!.events[index];
                  return EventsItem(
                    title: event.title,
                    username: event.username,
                    date: event.date,
                    tag: event.tag,
                  );
                }),
          ),
        ),
        const TitleItem(title: 'Дни рождения'),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: SizedBox(
            height: 96,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.news.length,
                itemBuilder: (context, index) {
                  final birthday = snapshot.data!.birthdays[index];
                  return BirthdaysItem(
                    name: birthday.name,
                    position: birthday.position,
                    date: birthday.date,
                  );
                }),
          ),
        ),
        const SizedBox(
          height: 46,
        ),
      ],
    );
  }
}
