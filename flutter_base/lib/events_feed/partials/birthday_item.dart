import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_base/events_feed/models.dart';
import 'package:flutter_base/events_feed/colors.dart';

int daysDiff(DateTime date) {
  DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day).difference(DateTime(now.year, now.month, now.day)).inDays;
}

const _style = TextStyle(
  color: AppColors.color,
  fontSize: 14.0,
);

class BirthdayItem extends StatelessWidget {
  const BirthdayItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final BirthdayModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.all(16.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainRowRenderer(item: item),
        ],
      ),
    );
  }
}

class MainRowRenderer extends StatelessWidget {
  const MainRowRenderer({
    Key? key,
    required this.item,
  }) : super(key: key);

  final BirthdayModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: _style,
                ),
                const SizedBox(height: 2.0),
                Text(
                  item.position,
                  style: _style.copyWith(
                    fontSize: 12.0,
                    height: 1.33,
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  daysDiff(item.date) == 0 ? 'Сегодня' : DateFormat('dd MMMM y').format(item.date),
                  style: _style.copyWith(
                    color: const Color.fromRGBO(148, 102, 255, 1),
                    fontSize: 12.0,
                    height: 1.66,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Icon(
            Icons.notifications_none,
            color: Color.fromRGBO(196, 196, 196, 0.5),
            size: 28,
          ),
        ),
      ],
    );
  }
}
