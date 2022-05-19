import 'package:flutter_base/events_feed/elements/common/ImageRound.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/data.dart';
import 'package:flutter_base/events_feed/elements/common/ImageWithAR.dart';
import 'package:flutter_base/events_feed/elements/common/ShimmerBlock.dart';

import '../colors.dart';
import '../feed_screen.dart';

List<Widget> Events(bool shimmer) {
  if (shimmer) {
    List<_EventItem> _eventsWithShimmer = [];
    for (var i = 0; i < 2; i++) {
      _eventsWithShimmer.add(_EventItem(
        shimmer: shimmer,
        date: DateTime.now(),
        title: '',
        username: '',
        tag: '',
      ));
    }
    return _eventsWithShimmer;
  }

  return eventList
      .map(
        (e) => _EventItem(
          shimmer: false,
          title: e.title,
          username: e.username,
          date: e.date,
          tag: e.tag,
        ),
      )
      .toList();
}

class _EventItem extends StatelessWidget {
  final bool shimmer;
  final String title;
  final String username;
  final DateTime date;
  final String? tag;

  const _EventItem({
    Key? key,
    required this.shimmer,
    required this.title,
    required this.username,
    required this.date,
    this.tag,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    shimmer
                                        ? const ShimmerBlock(
                                            width: 135,
                                            height: 25,
                                          )
                                        : SizedBox(
                                            width: 135,
                                            child: Text(
                                              username,
                                              style: styleEvents.copyWith(
                                                  fontSize: 14.0,
                                                  height: 18 / 14,
                                                  fontWeight: FontWeight.w400),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                    shimmer
                                        ? const ShimmerBlock(
                                            width: 45,
                                            height: 25,
                                          )
                                        : _Tag(tag: tag ?? '')
                                  ]),
                              _DateWithFormat(
                                  date: date,
                                  format: 'dd MMMM (EE)',
                                  shimmer: shimmer),
                              _DateWithFormat(
                                  date: date,
                                  format: 'HH:mm',
                                  shimmer: shimmer),
                            ],
                          )))
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: shimmer
                      ? const ShimmerBlock(
                          width: 260,
                          height: 40,
                        )
                      : Text(
                          title,
                          style: styleEvents.copyWith(
                              fontSize: 14.0, height: 20 / 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
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
                  color: AppColors.gray,
                  fontSize: 10.0,
                  height: 12 / 10,
                  fontWeight: FontWeight.w500,
                ),
              ));
  }
}

class _Tag extends StatelessWidget {
  final String tag;
  const _Tag({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.orange,
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 6, right: 6, top: 1),
          child: Text(tag,
              style: styleEvents.copyWith(
                  fontSize: 12.0,
                  height: 16 / 12,
                  fontWeight: FontWeight.w400))),
    );
  }
}
