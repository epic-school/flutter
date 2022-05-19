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
