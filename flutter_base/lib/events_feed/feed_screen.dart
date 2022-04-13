import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/colors.dart';
import 'package:flutter_base/events_feed/data.dart';
import 'package:flutter_base/events_feed/models.dart';
import 'package:intl/intl.dart';

const _style = TextStyle(
  color: AppColors.color,
  fontSize: 14.0,
);

var _now = DateTime.now();
var _today = DateTime(_now.year, _now.month, _now.day);

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
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _Title(title: 'Новости'),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: SizedBox(
                        height: 256.0,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.vertical,
                          children: newsList
                              .map(
                                (e) => _NewsItem(
                                  title: e.title,
                                  date: e.date,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    const _Title(title: 'Мероприятия'),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: SizedBox(
                        height: 152.0,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.vertical,
                          children: eventList
                              .map(
                                (e) => _EventItem(
                                  username: e.username,
                                  date: e.date,
                                  title: e.title,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    const _Title(title: 'Дни рождения'),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: SizedBox(
                        height: 96.0,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.vertical,
                          children: birthdayList
                              .map(
                                (e) => _BirthsdayItem(
                                  name: e.name,
                                  date: e.date,
                                  position: e.position,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;

  const _Title({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: _style.copyWith(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              height: 1.16,
            ),
          ),
          Container(
            width: 28.0,
            height: 28.0,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.cardBackground,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.chevron_right,
              color: AppColors.color,
            ),
          )
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('IMG'),
      ),
    );
  }
}

class _NewsItem extends StatelessWidget {
  final String title;
  final DateTime date;

  const _NewsItem({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          const AspectRatio(
            aspectRatio: 292 / 150,
            child: _Image(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title + '\n',
                  style: _style.copyWith(
                    fontSize: 16.0,
                    height: 1.375,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    DateFormat('dd MMMM y в HH:mm').format(date),
                    style: const TextStyle(
                      color: AppColors.gray,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _EventItem extends StatelessWidget {
  final String title;
  final String username;
  final DateTime date;

  const _EventItem({
    Key? key,
    required this.title,
    required this.date,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const SizedBox(
                        height: 64.0, width: 64.0, child: _Image())),
                SizedBox(
                  width: 137.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: _style.copyWith(
                            fontSize: 14.0,
                            height: 1.43,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            DateFormat('dd MMMM (EE) \nHH:mm').format(date),
                            style: const TextStyle(
                              color: AppColors.color,
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: SizedBox(
                    width: 47.0,
                    height: 20.0,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          "Митап",
                          style: _style.copyWith(
                              fontSize: 12.0,
                              height: 1.33,
                              color: AppColors.color),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: Text(
              title,
              style: _style.copyWith(
                fontSize: 14.0,
                height: 1.43,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _BirthsdayItem extends StatelessWidget {
  final String name;
  final String position;
  final DateTime date;

  const _BirthsdayItem({
    Key? key,
    required this.name,
    required this.date,
    required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child:
                    const SizedBox(height: 64.0, width: 64.0, child: _Image())),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SizedBox(
                width: 160.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: _style.copyWith(
                        fontSize: 14.0,
                        height: 1.43,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        position,
                        style: _style.copyWith(
                          fontSize: 12.0,
                          height: 1.33,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        _today == DateTime(date.year, date.month, date.day)
                            ? "Сегодня"
                            : DateFormat('MMMMd').format(date),
                        style: const TextStyle(
                          color: AppColors.purple,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          height: 1.33,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (_today == DateTime(date.year, date.month, date.day)) ...[
              const Expanded(
                  child: Icon(Icons.notifications_none, color: AppColors.gray))
            ] else
              ...[]
          ],
        ),
      ),
    );
  }
}
