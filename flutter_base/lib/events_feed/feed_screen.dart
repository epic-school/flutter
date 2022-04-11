import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';
import 'package:flutter_base/events_feed/constants/text_style.dart';
import 'package:flutter_base/events_feed/data.dart';
import 'package:flutter_base/events_feed/models.dart';
import 'package:flutter_base/events_feed/widgets/birthday_item.dart';
import 'package:flutter_base/events_feed/widgets/events_item.dart';
import 'package:flutter_base/events_feed/widgets/news_item.dart';
import 'package:flutter_base/events_feed/widgets/title_item.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Future<AllData> getData() async {
    await Future.delayed(const Duration(seconds: 0));
    return AllData(news: newsList, events: eventList, birthdays: birthdayList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Лента событий',
          style: AppTextStyle.appBar,
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        toolbarHeight: 52.0,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleItem(title: 'Новости'),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: SizedBox(
                          height: 256.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: newsList
                                .map(
                                  (e) => NewsItem(
                                    title: e.title,
                                    date: e.date,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      const TitleItem(title: 'Мероприятия'),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: SizedBox(
                          height: 152.0,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: eventList
                                .map(
                                  (e) => EventsItem(
                                    title: e.title,
                                    username: e.username,
                                    date: e.date,
                                    tag: e.tag,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      const TitleItem(title: 'Дни рождения'),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: SizedBox(
                          height: 96,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: birthdayList
                                .map((e) => BirthdayItem(
                                    name: e.name,
                                    position: e.position,
                                    date: e.date))
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 46,
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
