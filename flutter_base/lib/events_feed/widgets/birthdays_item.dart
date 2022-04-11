import 'package:flutter/material.dart';
import 'package:flutter_base/events_feed/components/box_layout.dart';
import 'package:flutter_base/events_feed/components/fake_image.dart';
import 'package:flutter_base/events_feed/constants/colors.dart';
import 'package:flutter_base/events_feed/components/reminder_button.dart';
import 'package:flutter_base/events_feed/components/user_photo.dart';
import 'package:flutter_base/events_feed/constants/text_style.dart';
import 'package:intl/intl.dart';

class BirthdaysItem extends StatelessWidget {
  final String name;
  final String position;
  final DateTime date;

  const BirthdaysItem(
      {Key? key,
      required this.name,
      required this.position,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoxLayout(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserPhoto(child: FakeImage(),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: 154.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyle.w400s14h20cW90,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                    Text(
                      position,
                      style: AppTextStyle.w400s12h16cW90,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                    Text(
                      DateFormat('dd MMMM').format(DateTime.now()) ==
                              DateFormat('dd MMMM').format(date)
                          ? 'Сегодня'
                          : DateFormat('dd MMMM').format(DateTime.now()
                                      .add(const Duration(days: 1))) ==
                                  DateFormat('dd MMMM').format(date)
                              ? 'Завтра'
                              : DateFormat('dd MMMM').format(date),
                      style: AppTextStyle.w400s12h16cW90.copyWith(
                          fontWeight: FontWeight.w700, color: AppColors.purple),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ],
                ),
              ),
            ),
            const ReminderButton(),
          ],
        ),
      ),
    );
  }
}
