import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';

class BoxLayout extends StatelessWidget {
  final double borderRadius;
  final Widget feedItem;

  const BoxLayout({
    Key? key,
    required this.borderRadius,
    required this.feedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: feedItem,
    );
  }
}
