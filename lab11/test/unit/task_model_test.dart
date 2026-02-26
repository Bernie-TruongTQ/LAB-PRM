import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/models/task.dart';

void main() {
  group('Task Model', () {
    test('default completed value should be false', () {
      // Arrange
      final task = Task(id: '1', title: 'Test Task');

      // Act — no action needed, testing default

      // Assert
      expect(task.completed, false);
    });

    test('toggle() should switch completed from false to true', () {
      // Arrange
      final task = Task(id: '1', title: 'Test Task');

      // Act
      task.toggle();

      // Assert
      expect(task.completed, true);
    });

    test('toggle() should switch completed from true to false', () {
      // Arrange
      final task = Task(id: '1', title: 'Test Task', completed: true);

      // Act
      task.toggle();

      // Assert
      expect(task.completed, false);
    });

    test('toggle() twice should return to original state', () {
      // Arrange
      final task = Task(id: '1', title: 'Test Task');

      // Act
      task.toggle();
      task.toggle();

      // Assert
      expect(task.completed, false);
    });
  });
}
