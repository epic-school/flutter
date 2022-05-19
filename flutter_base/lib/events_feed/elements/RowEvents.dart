import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/feed_screen.dart';

import '../colors.dart';

class RowEvents extends StatelessWidget {
  final String title;
  final List<Widget> items;
  final double height;
  const RowEvents({
    Key? key,
    required this.title,
    required this.items,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Title(title: title),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: SizedBox(
            height: height,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.vertical,
              children: items,
            ),
          ),
        ),
      ],
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
            style: styleEvents.copyWith(
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
