class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  PostModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];

  dynamic toJson() => {'userId': userId, 'id': id, 'title': title, 'body': body};

  @override
  String toString() {
    return toJson().toString();
  }
}
