import 'package:flutter_base/events_feed/models.dart';

final newsList = <NewsModel>[
  NewsModel(
    title: 'Дайджест №6 от корпоративного психолога',
    date: DateTime(2022, 1, 26, 16, 28),
  ),
  NewsModel(
    title: 'Набор в Школу Тимлида',
    date: DateTime(2022, 1, 24, 11, 42),
  ),
];

final eventList = <EventModel>[
  EventModel(
    title: 'В поисках оптимальной архитектуры проекта на Flutter',
    username: 'Анатолий Зверев',
    date: DateTime(2022, 04, 14, 11, 00),
  ),
  EventModel(
    title: 'Kotlin vs Java',
    username: 'Тихон Устинов',
    date: DateTime(2022, 04, 25, 16, 00),
  ),
];

final birthdayList = <BirthdayModel>[
  BirthdayModel(
    name: 'Александр Вахрушев',
    position: 'Менеджер проектов',
    date: DateTime.now(),
  ),
  BirthdayModel(
    name: 'Дмитрий Гуров',
    position: 'Ведущий разработчик',
    date: DateTime.now().add(const Duration(days: 1)),
  )
];
