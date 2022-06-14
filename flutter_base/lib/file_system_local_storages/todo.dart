class Todo {
  late final int? id;
  late final String title;
  late final bool done;

  Todo(this.title, this.done, {this.id});

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      "title": title,
      "done": done ? 1 : 0,
    };

    return map;
  }

  Todo.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    done = map["done"] == 1;
  }
}