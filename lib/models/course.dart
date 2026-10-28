class Course {
  final int id;
  final String name;
  final String code;
  final String teacher;

  const Course({
    required this.id,
    required this.name,
    required this.code,
    required this.teacher,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'code': String code,
        'teacher': String teacher,
      } =>
        Course(id: id, name: name, code: code, teacher: teacher),
      _ => throw FormatException('Données de cours invalides : $json'),
    };
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'code': code, 'teacher': teacher};
  }

  Course copyWith({int? id, String? name, String? code, String? teacher}) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      teacher: teacher ?? this.teacher,
    );
  }

  @override
  String toString() => 'Course #$id : $code - $name ($teacher)';
}
