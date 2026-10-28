class Task {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime dueDate;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
        'description': String description,
        'isCompleted': bool isCompleted,
        'dueDate': String dueDate,
      } =>
        Task(
          id: id,
          title: title,
          description: description,
          isCompleted: isCompleted,
          dueDate: DateTime.parse(dueDate),
        ),
      _ => throw FormatException('Données de tâche invalides : $json'),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'dueDate': dueDate.toIso8601String(),
    };
  }

  Task copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? dueDate,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  @override
  String toString() {
    final status = isCompleted ? 'terminée' : 'à faire';
    final date = dueDate.toIso8601String().substring(0, 10);
    return 'Task #$id : $title ($status, pour le $date)';
  }
}
