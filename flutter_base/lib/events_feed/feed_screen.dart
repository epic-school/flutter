import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/colors.dart';
import 'package:flutter_base/events_feed/data.dart';
import 'package:flutter_base/events_feed/models.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

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
                          (e) => _EventsItem(
                        title: e.title,
                        date: e.date,
                        username: e.username,
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
                    children:
                    // [
                    birthdayList
                        .map(
                          (e) => _BirthdayItem(
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

              : Shimmer.fromColors(
            baseColor: Colors.deepPurple,
            highlightColor: Colors.pinkAccent,
            child:
            Column(
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
                          .map(
                              (e) => const _EmptyNewsItem()
                      )
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
                          .map(
                              (e) =>const _EmptyEventsItem()
                      )
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
                      children:
                      // [
                      birthdayList
                          .map(
                            (e) => const _EmptyBirthdayItem(),
                      )
                          .toList(),
                    ),
                  ),
                ),
              ],),);
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

class _EventsItem extends StatelessWidget {
  final String title;
  final String username;
  final DateTime date;

  const _EventsItem({
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children:[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[

                        const _Avatar(),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                username,
                                style: _style.copyWith(
                                  fontSize: 14.0,
                                  height: 1.428,
                                ),
                              ),
                              Text(
                                DateFormat('dd MMMM (EE)').format(date),
                                //посмотреть как сделать с больших буковок
                                style: const TextStyle(
                                  color: AppColors.color,
                                  fontSize: 10.0,
                                  height: 1.2,
                                ),
                              ),
                              Text(
                                DateFormat('HH:mm').format(date),
                                style: const TextStyle(
                                  color: AppColors.color,
                                  fontSize: 10.0,
                                  height: 1.2,
                                ),
                              ),
                            ],),

                        ),
                      ],),
                  ],),
                const _MeetUp(),
              ],),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              //выглядит не очень как 16
              child: Text(
                title,
                style: _style.copyWith(
                  fontSize: 14.0,
                  height: 1.428,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      width: 64.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Center(
        child: Text('IMG'),
      ),
    );
  }
}

class _BirthdayItem extends StatelessWidget {
  final String position;
  final String name;
  final DateTime date;

  const _BirthdayItem({
    Key? key,
    required this.position,
    required this.date,
    required this.name,
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
      child: Padding(padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children:[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      const _Avatar(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: _style.copyWith(
                                fontSize: 14.0,
                                height: 1.428,
                              ),
                            ),
                            Text(
                              position,
                              style: const TextStyle(
                                color: AppColors.color,
                                fontSize: 12.0,
                                height: 1.333,
                              ),
                            ),
                            Text( DateTime.now().day==date.day ? 'Сегодня':
                            DateFormat('dd MMMM').format(date),
                              style: const TextStyle(
                                color: AppColors.purple,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0,
                                height: 1.333,
                              ),
                            ),
                          ],),

                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.add_alert_rounded, color: AppColors.gray),


            ],
          )),
    );
  }
}

class _MeetUp extends StatelessWidget {
  const _MeetUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 47.0,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(38.0),
      ),
      child: const Center(
        child: Text(
          'Митап',
          style: TextStyle(
            color: AppColors.color,
            fontSize: 12.0,
          ),
        ),
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
        child: _EmptyContainer(width: 343.0, height: 26.0,)
    );
  }
}
class _EmptyContainer extends StatelessWidget {
  final double width;
  final double height;

  const _EmptyContainer({
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

class _EmptyEventsItem extends StatelessWidget {

  const _EmptyEventsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292.0,
      height: 148.0,
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
              children:[

                const _EmptyContainer(width: 64.0, height: 64.0),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(padding: EdgeInsets.only(bottom: 11.0),
                          child: _EmptyContainer(width: 188.0, height: 20.0)
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 9.0),
                          child: _EmptyContainer(width: 188.0, height: 12.0)
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 12.0),
                          child: _EmptyContainer(width: 188.0, height: 12.0)
                      ),

                    ],),

                ),
              ],),
            const _EmptyContainer(width: 260.0, height: 40.0),
          ],
        ),
      ),
    );
  }
}
class _EmptyNewsItem extends StatelessWidget {

  const _EmptyNewsItem({
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
                _EmptyContainer(width: 260.0, height: 44.0),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: _EmptyContainer(width: 260.0, height: 22.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _EmptyBirthdayItem extends StatelessWidget {

  const _EmptyBirthdayItem({
    Key? key,
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
      child: Padding(padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _EmptyContainer(width: 64.0, height: 64.0),
              Padding(padding: const  EdgeInsets.only(left:8.0),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding:const EdgeInsets.only(bottom:11.0),
                      child:  Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          _EmptyContainer(width: 135.0, height: 20.0),
                          Padding(padding: EdgeInsets.only(left:6.0),
                            child:
                            _EmptyContainer(width: 47.0, height: 20.0),
                          ),
                        ],
                      ),),
                    const Padding(padding: EdgeInsets.only(bottom:9.0),
                      child: _EmptyContainer(width: 188.0, height: 12.0),),
                    const _EmptyContainer(width: 188.0, height: 12.0),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}