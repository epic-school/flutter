import 'package:flutter_base/events_feed/elements/common/ImageRound.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/data.dart';
import 'package:flutter_base/events_feed/elements/common/ImageWithAR.dart';
import 'package:flutter_base/events_feed/elements/common/ShimmerBlock.dart';

import '../colors.dart';
import '../feed_screen.dart';

List<Widget> Berthdays(bool shimmer) {
  if (shimmer) {
    List<_BerthdayItem> _berthdayWithShimmer = [];
    for (var i = 0; i < 2; i++) {
      _berthdayWithShimmer.add(_BerthdayItem(
          name: '', position: '', date: DateTime.now(), shimmer: shimmer));
    }
    return _berthdayWithShimmer;
  }
  return birthdayList
      .map(
        (e) => _BerthdayItem(
            name: e.name, position: e.position, date: e.date, shimmer: shimmer),
      )
      .toList();
}

class _BerthdayItem extends StatelessWidget {
  final bool shimmer;
  final String name;
  final String position;
  final DateTime date;

  const _BerthdayItem({
    Key? key,
    required this.shimmer,
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
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageRownd(width: 64, height: 64, shimmer: shimmer),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                shimmer
                                    ? const ShimmerBlock(
                                        width: 160,
                                        height: 24,
                                      )
                                    : SizedBox(
                                        width: 160,
                                        child: Text(
                                          name,
                                          style: styleEvents.copyWith(
                                              fontSize: 14.0,
                                              height: 18 / 14,
                                              fontWeight: FontWeight.w400),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                shimmer
                                    ? const ShimmerBlock(
                                        width: 20,
                                        height: 24,
                                      )
                                    : const _Bell()
                              ]),
                          Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: shimmer
                                  ? const ShimmerBlock(
                                      width: 188,
                                      height: 16,
                                    )
                                  : Text(
                                      position,
                                      style: styleEvents.copyWith(
                                          fontSize: 12.0,
                                          height: 16 / 12,
                                          fontWeight: FontWeight.w400),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                          _DateWithFormat(
                            date: date,
                            format: 'dd MMMM (EE)',
                            shimmer: shimmer,
                          )
                        ],
                      )))
            ],
          ),
        ));
  }
}

class _DateWithFormat extends StatelessWidget {
  final bool shimmer;
  final DateTime date;
  final String format;
  const _DateWithFormat({
    Key? key,
    required this.shimmer,
    required this.date,
    required this.format,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: shimmer
            ? const ShimmerBlock(
                width: 188,
                height: 16,
              )
            : Text(
                DateFormat(format).format(date),
                style: const TextStyle(
                  color: AppColors.purple,
                  fontSize: 12.0,
                  height: 16 / 12,
                  fontWeight: FontWeight.w700,
                ),
              ));
  }
}

class _Bell extends StatelessWidget {
  const _Bell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/icons/bell.png');
  }
}
