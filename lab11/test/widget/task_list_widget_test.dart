import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/repositories/task_repository.dart';
import 'package:lab11/screens/task_list_screen.dart';

void main() {
  late TaskRepository repository;

  setUp(() {
    repository = TaskRepository();
  });

  Widget createTestWidget() {
    return MaterialApp(home: TaskListScreen(repository: repository));
  }

  group('TaskListScreen Widget Tests', () {
    testWidgets('should display empty state message when no tasks exist', (
      WidgetTester tester,
    ) async {
      // Arrange & Act
      await tester.pumpWidget(createTestWidget());

      // Assert
      expect(find.text('No tasks yet. Add one!'), findsOneWidget);
    });

    testWidgets('should add a task and display it in the list', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());

      // Act
      await tester.enterText(
        find.byKey(const Key('taskTitleField')),
        'New Task',
      );
      await tester.tap(find.byKey(const Key('addTaskButton')));
      await tester.pump();

      // Assert
      expect(find.text('New Task'), findsOneWidget);
      expect(find.text('No tasks yet. Add one!'), findsNothing);
    });

    testWidgets('should add multiple tasks and display all of them', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());

      // Act — add first task
      await tester.enterText(
        find.byKey(const Key('taskTitleField')),
        'Task One',
      );
      await tester.tap(find.byKey(const Key('addTaskButton')));
      await tester.pump();

      // Act — add second task
      await tester.enterText(
        find.byKey(const Key('taskTitleField')),
        'Task Two',
      );
      await tester.tap(find.byKey(const Key('addTaskButton')));
      await tester.pump();

      // Assert
      expect(find.text('Task One'), findsOneWidget);
      expect(find.text('Task Two'), findsOneWidget);
    });

    testWidgets('should not add a task with empty title', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(createTestWidget());

      // Act — tap add without entering text
      await tester.tap(find.byKey(const Key('addTaskButton')));
      await tester.pump();

      // Assert — still shows empty state
      expect(find.text('No tasks yet. Add one!'), findsOneWidget);
    });
  });
}
