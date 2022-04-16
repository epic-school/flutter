import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/models.dart';
import 'package:intl/intl.dart';

import 'package:flutter_base/events_feed/colors.dart';

const _style = TextStyle(
  color: AppColors.color,
  fontSize: 14.0,
);

class EventItem extends StatelessWidget {
  const EventItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final EventModel item;

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
          MainRowRenderer(username: item.username, date: item.date),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              item.title,
              style: _style,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}

class MainRowRenderer extends StatelessWidget {
  const MainRowRenderer({
    Key? key,
    required this.username,
    required this.date,
  }) : super(key: key);

  final String username;
  final DateTime date;

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
                  username,
                  style: _style,
                ),
                const SizedBox(height: 2.0),
                Text(
                  DateFormat('dd MMMM (EE)').format(date),
                  style: _style.copyWith(
                    fontSize: 10.0,
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  DateFormat('HH:mm').format(date),
                  style: _style.copyWith(
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 94, 45, 1),
            borderRadius: BorderRadius.circular(38.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
          child: Text(
            'Митап',
            style: _style.copyWith(
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    );
  }
}
