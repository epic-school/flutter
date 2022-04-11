import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';
import 'package:flutter_base/events_feed/components/tag.dart';
import 'package:flutter_base/events_feed/components/user_photo.dart';
import 'package:flutter_base/events_feed/constants/text_style.dart';
import 'package:intl/intl.dart';

class EventsItem extends StatelessWidget {
  final String title;
  final String username;
  final DateTime date;
  final String? tag;

  const EventsItem({
    Key? key,
    required this.title,
    required this.username,
    required this.date,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _dayOfWeek =
        DateFormat('E').format(date).substring(0, 1).toUpperCase() +
            DateFormat('E').format(date).substring(1);
    return Container(
      width: 292.0,
      height: 152.0,
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
                const UserPhoto(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                  child: SizedBox(
                    width: 136.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: AppTextStyle.w400s14h20cW90,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          DateFormat('dd MMMM ($_dayOfWeek)\nHH:mm')
                              .format(date),
                          style: AppTextStyle.w500s10h12l02cW90,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                tag != null
                    ? Tag(
                        tag: tag!,
                        tagColor: AppColors.orange,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                title,
                style: AppTextStyle.w400s14h20cW90
                    .copyWith(color: AppColors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
