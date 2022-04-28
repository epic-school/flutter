class PostCommentModel {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  PostCommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  PostCommentModel.fromJson(Map<String, dynamic> json)
      : postId = json['postId'],
        id = json['id'],
        name = json['name'],
        email = json['email'],
        body = json['body'];

  dynamic toJson() => {'postId': postId, 'id': id, 'name': name, 'email': email, 'body': body};

  @override
  String toString() {
    return toJson().toString();
  }
}
