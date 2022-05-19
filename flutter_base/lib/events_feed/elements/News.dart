import 'package:flutter_base/events_feed/elements/common/ImageWithAR.dart';
import 'package:flutter_base/events_feed/elements/common/ShimmerBlock.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/data.dart';

import '../colors.dart';
import '../feed_screen.dart';

List<Widget> News(bool shimmer) {
  if (shimmer) {
    List<_NewsItem> _newsWithShimmer = [];
    for (var i = 0; i < 2; i++) {
      _newsWithShimmer.add(_NewsItem(
        shimmer: shimmer,
        title: '',
        date: DateTime.now(),
      ));
    }
    return _newsWithShimmer;
  }
  return newsList
      .map(
        (e) => _NewsItem(
          title: e.title,
          date: e.date,
          shimmer: false,
        ),
      )
      .toList();
}

class _NewsItem extends StatelessWidget {
  final bool shimmer;
  final String title;
  final DateTime date;

  const _NewsItem({
    Key? key,
    required this.shimmer,
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
          ImageWithAR(width: 292, height: 150, shimmer: shimmer),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                shimmer
                    ? const ShimmerBlock(
                        width: 260,
                        height: 44,
                      )
                    : Text(
                        title,
                        style:
                            styleEvents.copyWith(fontSize: 16.0, height: 1.375),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: shimmer
                      ? const ShimmerBlock(
                          width: 260,
                          height: 20,
                        )
                      : Text(
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
