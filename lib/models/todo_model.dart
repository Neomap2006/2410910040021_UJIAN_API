class TodoModel {
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  TodoModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }
}

class TodoResponse {
  final List<TodoModel> todos;

  TodoResponse({required this.todos});

  factory TodoResponse.fromJson(Map<String, dynamic> json) {
    return TodoResponse(
      todos: (json['todos'] as List)
          .map((item) => TodoModel.fromJson(item))
          .toList(),
    );
  }
}
