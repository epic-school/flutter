import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/colors.dart';
import 'package:flutter_base/events_feed/data.dart';
import 'package:flutter_base/events_feed/models.dart';

const _style = TextStyle(
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
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const _Title(title: 'Новости'),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: SizedBox(
                        height: 256.0,
                        child: Wrap(
                          direction: Axis.vertical,
                          children: newsList
                              .map(
                                (n) => _NewsItem(
                                  title: n.title,
                                  date: n.date,
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
                        height: 150,
                        child: Wrap(
                          direction: Axis.vertical,
                          children: eventList
                              .map((e) => _EvenItem(
                                  title: e.title,
                                  username: e.username,
                                  date: e.date))
                              .toList(),
                        ),
                      ),
                    ),
                    const _Title(title: 'Дни рождения'),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: SizedBox(
                        height: 110.0,
                        child: Wrap(
                          direction: Axis.vertical,
                          children: birthdayList
                              .map((e) => _BirthdayItem(
                                  name: e.name,
                                  position: e.position,
                                  date: e.date))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                )
              : Shimmer.fromColors(
                  baseColor: Colors.deepPurple,
                  highlightColor: Colors.pinkAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _EmptyTitle(),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: SizedBox(
                          height: 256.0,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.vertical,
                            children: newsList
                                .map((e) => const _NewsLoading())
                                .toList(),
                          ),
                        ),
                      ),
                      const _EmptyTitle(),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: SizedBox(
                          height: 152.0,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.vertical,
                            children: eventList
                                .map((e) => const _EventLoading())
                                .toList(),
                          ),
                        ),
                      ),
                      const _EmptyTitle(),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: SizedBox(
                          height: 96.0,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.vertical,
                            children: birthdayList
                                .map(
                                  (e) => const _BirthdayLoading(),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class _ViewLoading extends StatelessWidget {
  final double width;
  final double height;

  const _ViewLoading({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8.0),
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

class _EmptyTitle extends StatelessWidget {
  const _EmptyTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(16.0),
        child: _ViewLoading(
          width: 343.0,
          height: 26.0,
        ));
  }
}

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 64,
      height: 64,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: AppColors.color,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: AppColors.cardBackground)),
      child: const Text('img'),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AspectRatio(
            aspectRatio: 292 / 150,
            child: _Image(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
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

class _NewsLoading extends StatelessWidget {
  const _NewsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292.0,
      height: 256.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _ViewLoading(width: 292.0, height: 44.0),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: _ViewLoading(width: 292.0, height: 22.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _EvenItem extends StatelessWidget {
  final String title;
  final String username;
  final DateTime date;

  const _EvenItem({
    Key? key,
    required this.title,
    required this.username,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292.0,
      height: 151,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Image(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                  child: SizedBox(
                    width: 136.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Лента событий',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            color: AppColors.color,
                          ),
                        ),
                        Text(
                          DateFormat('dd MMMM (EEE) \nHH:mm').format(date),
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                            color: AppColors.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 47,
                  height: 20,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: AppColors.cardBackground)),
                  child: const Text(
                    'митап',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w300,
                      color: AppColors.color,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                  color: AppColors.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EventLoading extends StatelessWidget {
  const _EventLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292.0,
      height: 152.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _ViewLoading(width: 64.0, height: 64.0),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                          padding: EdgeInsets.only(bottom: 11.0),
                          child: _ViewLoading(width: 188.0, height: 20.0)),
                      Padding(
                          padding: EdgeInsets.only(bottom: 9.0),
                          child: _ViewLoading(width: 188.0, height: 12.0)),
                      Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: _ViewLoading(width: 188.0, height: 12.0)),
                    ],
                  ),
                ),
              ],
            ),
            const _ViewLoading(width: 260.0, height: 40.0),
          ],
        ),
      ),
    );
  }
}

class _BirthdayItem extends StatelessWidget {
  final String name;
  final String position;
  final DateTime date;

  const _BirthdayItem({
    Key? key,
    required this.name,
    required this.position,
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Image(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                  child: SizedBox(
                    width: 136.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            color: AppColors.color,
                          ),
                        ),
                        Text(
                          position,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            color: AppColors.color,
                          ),
                        ),
                        Text(
                          DateTime.now().day == date.day
                              ? 'Сегодня'
                              : DateFormat('dd MMMM').format(date),
                          style: const TextStyle(
                            color: AppColors.purple,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            height: 1.333,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Icon(Icons.alarm_on, color: AppColors.gray),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BirthdayLoading extends StatelessWidget {
  const _BirthdayLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292.0,
      height: 96,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _ViewLoading(width: 64.0, height: 64.0),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 11.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          _ViewLoading(width: 135.0, height: 20.0),
                          Padding(
                            padding: EdgeInsets.only(left: 6.0),
                            child: _ViewLoading(width: 47.0, height: 20.0),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 9.0),
                      child: _ViewLoading(width: 188.0, height: 12.0),
                    ),
                    const _ViewLoading(width: 188.0, height: 12.0),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
