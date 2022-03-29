void main() {
  /// Создание объектов
  // DateTime(int year, [int month = 1, int day = 1, int hour = 0, int minute = 0, int second = 0, int millisecond = 0, int microsecond = 0])
  // DateTime.fromMicrosecondsSinceEpoch(int microsecondsSinceEpoch, {bool isUtc = false})
  // DateTime.fromMillisecondsSinceEpoch(int millisecondsSinceEpoch, {bool isUtc = false})
  // DateTime.now()
  // DateTime.utc(int year, [int month = 1, int day = 1, int hour = 0, int minute = 0, int second = 0, int millisecond = 0, int microsecond = 0])

  // final now = DateTime.now();
  // print(now);

  // final berlinWallFell = DateTime.utc(1989, 11, 9);
  // print(berlinWallFell);

  // final moonLanding = DateTime.parse('1969-07-20 20:18:04Z');
  // print(moonLanding);

  /// Паттерны парсинга
  // "2012-02-27"
  // "2012-02-27 13:27:00"
  // "2012-02-27 13:27:00.123456789z"
  // "2012-02-27 13:27:00,123456789z"
  // "20120227 13:27:00"
  // "20120227T132700"
  // "20120227"
  // "+20120227"
  // "2012-02-27T14Z"
  // "2012-02-27T14+00:00"
  // "-123450101 00:00:00 Z": in the year -12345.
  // "2002-02-27T14:00:00-0500": Same as "2002-02-27T19:00:00Z"

  // final date = DateTime.tryParse('1969 07 20') ?? DateTime.now();
  // print(date);

  // /// Свойства объекта
  // print(date.isUtc);
  // print(date.year);
  // print(date.weekday);
  // print(date.timeZoneOffset);

  // /// Duration
  // //  Duration({int days = 0, int hours = 0, int minutes = 0, int seconds = 0, int milliseconds = 0, int microseconds = 0})
  // const duration = Duration(days: 25, hours: 10);
  // print(duration);
  // print(duration.inMinutes);

  // /// Методы работы с датой
  // final date1 = DateTime.now();
  // final date2 = date1.subtract(Duration(days: 400));
  // final date3 = date1.add(Duration(days: 400));
  // print(date1.isBefore(date2));
  // print(date1.isAfter(date2));
  // print(date1.compareTo(date2));
  // print(date1.difference(date2));
  // print(date1.toLocal());
  // print(date1.toUtc());
  // print(date1.toIso8601String());
}
