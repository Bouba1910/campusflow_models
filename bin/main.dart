import 'dart:convert';

import 'package:campusflow_models/models/task.dart';
import 'package:campusflow_models/services/campusflow_service.dart';

Future<void> main() async {
  const service = CampusFlowService();

  print('Chargement des données...');
  final tasks = await service.fetchTasks();
  final courses = await service.fetchCourses();
  final users = await service.fetchUsers();

  print('\nTâches :');
  tasks.forEach(print);
  print('\nCours :');
  courses.forEach(print);
  print('\nUtilisateurs :');
  users.forEach(print);

  final firstTask = tasks.first;
  final encoded = jsonEncode(firstTask.toJson());
  print('\nTâche encodée en JSON :\n$encoded');

  final decoded = Task.fromJson(jsonDecode(encoded) as Map<String, dynamic>);
  print('Tâche reconstruite : $decoded');

  final doneTask = firstTask.copyWith(isCompleted: true);
  print('\ncopyWith(isCompleted: true) :');
  print('  avant : $firstTask');
  print('  après : $doneTask');
}
