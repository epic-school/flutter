import 'package:flutter/material.dart';

import 'package:flutter_base/events_feed/models.dart';
import 'package:flutter_base/events_feed/partials/event_item.dart';

class EventsList extends StatelessWidget {
  const EventsList({
    Key? key,
    required this.events,
  }) : super(key: key);

  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162.0,
      padding: const EdgeInsets.only(left: 12.0, bottom: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 300.0,
            child: EventItem(
              item: events[index],
            ),
          );
        },
      ),
    );
  }
}
