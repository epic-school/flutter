import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/components/box_layout.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';
import 'package:flutter_base/events_feed/components/fake_image.dart';
import 'package:flutter_base/events_feed/constants/decoration.dart';
import 'package:flutter_base/events_feed/constants/text_style.dart';
import 'package:flutter_base/events_feed/widgets/news_image.dart';
import 'package:intl/intl.dart';

class NewsItem extends StatelessWidget {
  final String title;
  final DateTime date;

  const NewsItem({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoxLayout(
      decoration: AppDecoration.decorT8B16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NewsImage(child: FakeImage()),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.w400s14h20cW90
                      .copyWith(fontSize: 16.0, height: 1.375),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    DateFormat('dd MMMM y в HH:mm').format(date),
                    style: AppTextStyle.w400s14h20cW90
                        .copyWith(color: AppColors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
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
