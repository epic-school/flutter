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
  (index) => UserItemModel(
    name: "Bobby Langford $index",
    avatar: "https://i.pravatar.cc/200?u=$index",
    lastMessage: "Last message string",
  ),
);

final List<UserItemModel> resentUsersList = List.generate(
  12,
  (index) => UserItemModel(
    name: "Berry",
    avatar: "https://i.pravatar.cc/200?u=$index",
    lastMessage: "Last message string",
  ),
);

enum MessageType { input, output }

class ChatItemMessageModel {
  final MessageType type;
  final String date;
  final String text;

  ChatItemMessageModel({
    required this.type,
    required this.date,
    required this.text,
  });
}

final List<ChatItemMessageModel> mockMessagesList = [
  ChatItemMessageModel(
      type: MessageType.output,
      date: '2022-06-20 20:28',
      text: 'text output 16'),
  ChatItemMessageModel(
      type: MessageType.output,
      date: '2022-06-20 20:28',
      text: 'text output 15'),
  ChatItemMessageModel(
      type: MessageType.output,
      date: '2022-06-20 20:27',
      text: 'text output 14'),
  ChatItemMessageModel(
      type: MessageType.output,
      date: '2022-06-20 20:27',
      text: 'text output 13'),
  ChatItemMessageModel(
      type: MessageType.input, date: '2022-06-20 20:20', text: 'text input 12'),
  ChatItemMessageModel(
      type: MessageType.output,
      date: '2022-06-20 20:26',
      text:
          'text text text text text text text text text text text text text output 11'),
  ChatItemMessageModel(
      type: MessageType.input,
      date: '2022-06-20 20:25',
      text: 'text text text text text text text input 10'),
  ChatItemMessageModel(
      type: MessageType.output,
      date: '2022-06-20 20:24',
      text: 'text output 9'),
  ChatItemMessageModel(
      type: MessageType.output,
      date: '2022-06-20 20:24',
      text: 'text output 8'),
  ChatItemMessageModel(
      type: MessageType.output,
      date: '2022-06-20 20:20',
      text: 'text output 7'),
  ChatItemMessageModel(
      type: MessageType.output,
      date: '2022-06-20 20:20',
      text: 'text output 6'),
  ChatItemMessageModel(
      type: MessageType.output,
      date: '2022-06-20 20:20',
      text: 'text output 5'),
  ChatItemMessageModel(
      type: MessageType.input, date: '2022-06-28 20:19', text: 'Хорошо'),
  ChatItemMessageModel(
      type: MessageType.input,
      date: '2022-06-28 20:18',
      text: 'Привет привет?'),
  ChatItemMessageModel(
      type: MessageType.output, date: '2022-06-28 20:17', text: 'Как дела'),
  ChatItemMessageModel(
      type: MessageType.output, date: '2022-06-28 20:16', text: 'Привет'),
];
