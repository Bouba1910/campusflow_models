import 'dart:convert';

import 'package:campusflow_models/models/course.dart';
import 'package:campusflow_models/models/task.dart';
import 'package:campusflow_models/models/user.dart';
import 'package:test/test.dart';

void main() {
  test('copyWith modifie la copie sans toucher à l\'original', () {
    final task = Task(
      id: 1,
      title: 'Rendre le TP',
      description: 'Modèles Dart',
      dueDate: DateTime(2026, 11, 4),
    );

    final updated = task.copyWith(isCompleted: true, title: 'TP rendu');

    expect(updated.isCompleted, isTrue);
    expect(updated.title, 'TP rendu');
    expect(updated.id, task.id);
    expect(updated.dueDate, task.dueDate);
    expect(task.isCompleted, isFalse);
    expect(task.title, 'Rendre le TP');
  });

  test('fromJson reconstruit les modèles à partir de JSON valide', () {
    const source = '''
      {"id": 7, "title": "Exposé", "description": "Flutter", "isCompleted": true,
       "dueDate": "2026-11-12T10:00:00.000"}
    ''';

    final task = Task.fromJson(jsonDecode(source) as Map<String, dynamic>);

    expect(task.id, 7);
    expect(task.title, 'Exposé');
    expect(task.description, 'Flutter');
    expect(task.isCompleted, isTrue);
    expect(task.dueDate, DateTime(2026, 11, 12, 10));
    expect(task.toJson(), jsonDecode(source));

    final course = Course.fromJson({
      'id': 1,
      'name': 'Développement mobile',
      'code': 'INF351',
      'teacher': 'Mme Diallo',
    });
    expect(course.code, 'INF351');

    final user =
        User.fromJson({'id': 2, 'name': 'Awa', 'email': 'awa@campus.fr'});
    expect(user.email, 'awa@campus.fr');
  });

  test('des données JSON invalides lèvent une FormatException', () {
    // Champ manquant, mauvais type, puis date illisible.
    expect(
      () => Task.fromJson({'id': 1, 'title': 'Sans date'}),
      throwsFormatException,
    );
    expect(
      () => User.fromJson({'id': '1', 'name': 'Awa', 'email': 'awa@campus.fr'}),
      throwsFormatException,
    );
    expect(
      () => Task.fromJson({
        'id': 1,
        'title': 'TP',
        'description': '',
        'isCompleted': false,
        'dueDate': 'demain',
      }),
      throwsFormatException,
    );
  });
}
