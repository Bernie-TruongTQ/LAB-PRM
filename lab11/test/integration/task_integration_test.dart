import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab11/models/task.dart';
import 'package:lab11/repositories/task_repository.dart';
import 'package:lab11/screens/task_list_screen.dart';

/// Integration test — end-to-end flow covering task creation, editing, and deletion.
/// This mirrors test/widget/task_integration_test.dart but lives under
/// test/integration/ for the consolidated test suite structure (Lab 11.5).
void main() {
  late TaskRepository repository;

  setUp(() {
    repository = TaskRepository();
  });

  Widget createTestWidget() {
    return MaterialApp(home: TaskListScreen(repository: repository));
  }

  group('End-to-End Integration Tests', () {
    testWidgets('add → edit via detail → save → verify updated in list', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      // Add "Original title"
      await tester.enterText(
        find.byKey(const Key('taskTitleField')),
        'Original title',
      );
      await tester.tap(find.byKey(const Key('addTaskButton')));
      await tester.pump();
      expect(find.text('Original title'), findsOneWidget);

      // Tap task → open detail
      await tester.tap(find.text('Original title'));
      await tester.pumpAndSettle();
      expect(find.text('Task Detail'), findsOneWidget);

      // Edit title
      await tester.enterText(
        find.byKey(const Key('detailTitleField')),
        'Updated title',
      );
      await tester.pump();

      // Save
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Verify update
      expect(find.text('Updated title'), findsOneWidget);
      expect(find.text('Original title'), findsNothing);
    });

    testWidgets('seed tasks → navigate → verify detail → go back', (
      WidgetTester tester,
    ) async {
      // Seed
      repository.addTask(Task(id: '1', title: 'Seeded Integration Task'));

      await tester.pumpWidget(createTestWidget());
      expect(find.text('Seeded Integration Task'), findsOneWidget);

      // Navigate
      await tester.tap(find.text('Seeded Integration Task'));
      await tester.pumpAndSettle();
      expect(find.text('Task Detail'), findsOneWidget);

      // Go back
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      expect(find.text('Taskly'), findsOneWidget);
    });
  });
}
