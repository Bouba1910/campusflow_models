import 'dart:convert';

import '../models/course.dart';
import '../models/task.dart';
import '../models/user.dart';

// Données fictives au format JSON, comme si elles venaient d'une API.
const _tasksJson = '''
[
  {"id": 1, "title": "Rendre le TP Dart", "description": "Modèles et sérialisation JSON", "isCompleted": false, "dueDate": "2026-11-04T23:59:00.000"},
  {"id": 2, "title": "Réviser les Futures", "description": "Relire le cours sur async/await", "isCompleted": true, "dueDate": "2026-10-30T18:00:00.000"},
  {"id": 3, "title": "Préparer l'exposé", "description": "Slides sur les widgets Flutter", "isCompleted": false, "dueDate": "2026-11-12T10:00:00.000"}
]
''';

const _coursesJson = '''
[
  {"id": 1, "name": "Développement mobile", "code": "INF351", "teacher": "Mme Diallo"},
  {"id": 2, "name": "Bases de données", "code": "INF322", "teacher": "M. Ouédraogo"}
]
''';

const _usersJson = '''
[
  {"id": 1, "name": "Awa Traoré", "email": "awa.traore@campus.fr"},
  {"id": 2, "name": "Lucas Martin", "email": "lucas.martin@campus.fr"}
]
''';

class CampusFlowService {
  final Duration delay;
  final String tasksJson;
  final String coursesJson;
  final String usersJson;

  const CampusFlowService({
    this.delay = const Duration(milliseconds: 500),
    this.tasksJson = _tasksJson,
    this.coursesJson = _coursesJson,
    this.usersJson = _usersJson,
  });

  Future<List<Task>> fetchTasks() async {
    final data = await _load(tasksJson);
    return data.map(Task.fromJson).toList();
  }

  Future<List<Course>> fetchCourses() async {
    final data = await _load(coursesJson);
    return data.map(Course.fromJson).toList();
  }

  Future<List<User>> fetchUsers() async {
    final data = await _load(usersJson);
    return data.map(User.fromJson).toList();
  }

  Future<List<Map<String, dynamic>>> _load(String source) {
    return Future.delayed(delay, () {
      final decoded = jsonDecode(source);
      if (decoded is! List ||
          decoded.any((item) => item is! Map<String, dynamic>)) {
        throw const FormatException('Une liste d\'objets JSON était attendue');
      }
      return decoded.cast<Map<String, dynamic>>();
    });
  }
}
