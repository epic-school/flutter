import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';
import 'package:flutter_base/events_feed/constants/text_style.dart';
import 'package:flutter_base/events_feed/data.dart';
import 'package:flutter_base/events_feed/models.dart';
import 'package:flutter_base/events_feed/widgets/feeds_view.dart';
import 'package:flutter_base/events_feed/widgets/skeleton.dart';

class EventsFeedScreen extends StatefulWidget {
  const EventsFeedScreen({Key? key}) : super(key: key);

  @override
  State<EventsFeedScreen> createState() => _EventsFeedScreenState();
}

class _EventsFeedScreenState extends State<EventsFeedScreen> {
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
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: FutureBuilder<AllData>(
            future: getData(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? FeedsView(context: context,snapshot: snapshot)
                  : const Skeleton();
            },
          ),
        ),
      ),
    );
  }
}
