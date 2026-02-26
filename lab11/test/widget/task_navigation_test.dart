import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/models/task.dart';
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

  group('Task Navigation Tests', () {
    testWidgets('should navigate to TaskDetailScreen when tapping a task', (
      WidgetTester tester,
    ) async {
      // Arrange — seed the repository with one task
      repository.addTask(Task(id: '1', title: 'Seeded Task'));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.tap(find.text('Seeded Task'));
      await tester.pumpAndSettle();

      // Assert — verify we are on the detail screen
      expect(find.text('Task Detail'), findsOneWidget);
      expect(find.byKey(const Key('detailTitleField')), findsOneWidget);
    });

    testWidgets('should show correct task title in detail screen', (
      WidgetTester tester,
    ) async {
      // Arrange
      repository.addTask(Task(id: '1', title: 'My Important Task'));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.tap(find.text('My Important Task'));
      await tester.pumpAndSettle();

      // Assert — the TextField should contain the task title
      final textField = tester.widget<TextField>(
        find.byKey(const Key('detailTitleField')),
      );
      expect(textField.controller?.text, 'My Important Task');
    });

    testWidgets('should navigate back to list when pressing back', (
      WidgetTester tester,
    ) async {
      // Arrange
      repository.addTask(Task(id: '1', title: 'Navigate Back Test'));

      // Act
      await tester.pumpWidget(createTestWidget());
      await tester.tap(find.text('Navigate Back Test'));
      await tester.pumpAndSettle();

      // Verify we are on detail screen
      expect(find.text('Task Detail'), findsOneWidget);

      // Navigate back
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      // Assert — back on list screen
      expect(find.text('Taskly'), findsOneWidget);
      expect(find.text('Navigate Back Test'), findsOneWidget);
    });
  });
}
