import 'package:campusflow_models/services/campusflow_service.dart';
import 'package:test/test.dart';

void main() {
  test('le service rejette une liste contenant autre chose que des objets', () {
    const service = CampusFlowService(
      delay: Duration.zero,
      tasksJson: '[1, "x"]',
    );

    expect(service.fetchTasks(), throwsFormatException);
  });
}
