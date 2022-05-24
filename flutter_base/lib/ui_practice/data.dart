import 'dart:math';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:intl/intl.dart';

class UserItemModel {
  final String name;
  final String avatar;
  final String lastMessage;

  UserItemModel({
    required this.name,
    required this.avatar,
    required this.lastMessage,
  });
}

final List<UserItemModel> usersList = List.generate(
  120,
      (index) =>
      UserItemModel(
        name:
        "${lorem(paragraphs: 1, words: 1).replaceAll('.', '')} ${lorem(
            paragraphs: 1, words: 1).replaceAll('.', '')}",
        avatar: "https://i.pravatar.cc/200?u=$index",
        lastMessage: messageList[index].messageText.isNotEmpty
            ? messageList[index].messageText
            : '😎',
      ),
);

final List<UserItemModel> resentUsersList = List.generate(
  12,
      (index) =>
      UserItemModel(
        name: lorem(paragraphs: 1, words: 1).replaceAll('.', ''),
        avatar: "https://i.pravatar.cc/200?u=${index + 30}",
        lastMessage: "Last message string",
      ),
);

class Message {
  final String messageText;
  final String messageType;

  const Message({required this.messageText, required this.messageType});
}

final messageType = <String>['in', 'out'];

final messageList = List.generate(
  120,
      (index) =>
      Message(
          messageText: lorem(paragraphs: 1, words: Random().nextInt(30)),
          messageType: messageType[Random().nextInt(messageType.length)]),
);

class MessageDate {
  final String date;

  MessageDate(this.date);
}

final dateList = List.generate(120, (index) =>
    MessageDate(DateFormat('d MMM HH:mm').format(
        DateTime.utc(2022, Random().nextInt(12) + 1,
            Random().nextInt(30) + 1, Random().nextInt(24),
            Random().nextInt(60))).toUpperCase())
);

