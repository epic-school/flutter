import 'package:flutter/material.dart';

import 'package:flutter_base/events_feed/models.dart';
import 'package:flutter_base/events_feed/partials/birthday_item.dart';

class BirthdaysList extends StatelessWidget {
  const BirthdaysList({
    Key? key,
    required this.birthdays,
  }) : super(key: key);

  final List<BirthdayModel> birthdays;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106.0,
      padding: const EdgeInsets.only(left: 12.0, bottom: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: birthdays.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 300.0,
            child: BirthdayItem(
              item: birthdays[index],
            ),
          );
        },
      ),
    );
  }
}
