class NewsModel {
  final String id;
  final String image;
  final String title;
  final DateTime date;

  NewsModel({
    this.id = '',
    this.image = '',
    required this.title,
    required this.date,
  });
}

class EventModel {
  final String id;
  final String title;
  final String username;
  final String avatar;
  final String? tag;
  final DateTime date;

  EventModel({
    this.id = '',
    required this.title,
    required this.username,
    this.avatar = '',
    this.tag,
    required this.date,
  });
}

class BirthdayModel {
  final String id;
  final String image;
  final String name;
  final String position;
  final DateTime date;
  final bool notification;

  BirthdayModel({
    this.id = '',
    this.image = '',
    required this.name,
    required this.position,
    required this.date,
    this.notification = false,
  });
}

class AllData {
  final List<NewsModel> news;
  final List<EventModel> events;
  final List<BirthdayModel> birthdays;

  AllData({
    this.news = const [],
    this.events = const [],
    this.birthdays = const [],
  });
}
