import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/models/task.dart';
import 'package:lab11/repositories/task_repository.dart';

void main() {
  late TaskRepository repository;

  setUp(() {
    repository = TaskRepository();
  });

  group('TaskRepository', () {
    group('addTask()', () {
      test('should add a task to the repository', () {
        // Arrange
        final task = Task(id: '1', title: 'Buy groceries');

        // Act
        repository.addTask(task);

        // Assert
        expect(repository.tasks.length, 1);
        expect(repository.tasks.first.title, 'Buy groceries');
      });

      test('should add multiple tasks to the repository', () {
        // Arrange
        final task1 = Task(id: '1', title: 'Task 1');
        final task2 = Task(id: '2', title: 'Task 2');

        // Act
        repository.addTask(task1);
        repository.addTask(task2);

        // Assert
        expect(repository.tasks.length, 2);
      });
    });

    group('deleteTask()', () {
      test('should remove a task by id', () {
        // Arrange
        final task = Task(id: '1', title: 'Task to delete');
        repository.addTask(task);

        // Act
        repository.deleteTask('1');

        // Assert
        expect(repository.tasks.length, 0);
      });

      test('should only remove the specified task', () {
        // Arrange
        final task1 = Task(id: '1', title: 'Task 1');
        final task2 = Task(id: '2', title: 'Task 2');
        repository.addTask(task1);
        repository.addTask(task2);

        // Act
        repository.deleteTask('1');

        // Assert
        expect(repository.tasks.length, 1);
        expect(repository.tasks.first.id, '2');
      });
    });

    group('updateTask()', () {
      test('should update the title of an existing task', () {
        // Arrange
        final task = Task(id: '1', title: 'Old Title');
        repository.addTask(task);

        // Act
        repository.updateTask('1', 'New Title');

        // Assert
        expect(repository.tasks.first.title, 'New Title');
      });

      test('should not affect other tasks when updating', () {
        // Arrange
        final task1 = Task(id: '1', title: 'Task 1');
        final task2 = Task(id: '2', title: 'Task 2');
        repository.addTask(task1);
        repository.addTask(task2);

        // Act
        repository.updateTask('1', 'Updated Task 1');

        // Assert
        expect(repository.tasks[0].title, 'Updated Task 1');
        expect(repository.tasks[1].title, 'Task 2');
      });
    });

    group('getTaskById()', () {
      test('should return the correct task by id', () {
        // Arrange
        final task = Task(id: '1', title: 'Find me');
        repository.addTask(task);

        // Act
        final result = repository.getTaskById('1');

        // Assert
        expect(result.title, 'Find me');
        expect(result.id, '1');
      });
    });
  });
}
