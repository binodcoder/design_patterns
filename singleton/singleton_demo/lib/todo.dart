class Todo {
  Todo({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int? userId;
  int? id;
  String? title;
  bool? completed;

  factory Todo.fromJson(json) {
    return Todo(
      userId: json["userId"],
      id: json["id"],
      title: null,
      completed: json["completed"],
    );
  }
}
