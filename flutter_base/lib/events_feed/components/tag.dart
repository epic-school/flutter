import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';
import 'package:flutter_base/events_feed/constants/text_style.dart';
import 'package:marquee/marquee.dart';

class Tag extends StatelessWidget {
  final String tag;
  final Color? tagColor;

  const Tag({
    Key? key,
    required this.tag,
    this.tagColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
      alignment: Alignment.center,
      width: 48.0,
      height: 20.0,
      decoration: BoxDecoration(
          color: tagColor, borderRadius: BorderRadius.circular(38.0)),
      child: Marquee(
        text: tag,
        style: AppTextStyle.w400s12h16cW90.copyWith(color: AppColors.white),
        blankSpace: 10.0,
        velocity: 10.0,
        fadingEdgeStartFraction: 0.2,
        fadingEdgeEndFraction: 0.2,
      ),
    );
  }
}
