import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_base/events_feed/colors.dart';
import 'package:flutter_base/events_feed/models.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final NewsModel item;

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
          AspectRatio(
            aspectRatio: 292 / 150,
            child: Container(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: AppColors.color,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    DateFormat('dd MMMM y в HH:mm').format(item.date),
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
