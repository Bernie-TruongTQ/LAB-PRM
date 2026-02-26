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

  group('Task Integration Tests', () {
    testWidgets(
      'full flow: add task → open detail → edit title → save → verify update',
      (WidgetTester tester) async {
        // --- Step 1: Add "Original title" ---
        await tester.pumpWidget(createTestWidget());

        await tester.enterText(
          find.byKey(const Key('taskTitleField')),
          'Original title',
        );
        await tester.tap(find.byKey(const Key('addTaskButton')));
        await tester.pump();

        // Verify task was added
        expect(find.text('Original title'), findsOneWidget);

        // --- Step 2: Tap task → open detail ---
        await tester.tap(find.text('Original title'));
        await tester.pumpAndSettle();

        // Verify we are on the detail screen
        expect(find.text('Task Detail'), findsOneWidget);
        expect(find.byKey(const Key('detailTitleField')), findsOneWidget);

        // --- Step 3: Edit title to "Updated title" ---
        final detailField = find.byKey(const Key('detailTitleField'));
        await tester.enterText(detailField, 'Updated title');
        await tester.pump();

        // --- Step 4: Save ---
        await tester.tap(find.text('Save'));
        await tester.pumpAndSettle();

        // --- Step 5: Verify updated title appears in list ---
        expect(find.text('Updated title'), findsOneWidget);
        expect(find.text('Original title'), findsNothing);
      },
    );

    testWidgets(
      'full flow: add multiple tasks → delete one → verify remaining',
      (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        // Add first task
        await tester.enterText(
          find.byKey(const Key('taskTitleField')),
          'Task A',
        );
        await tester.tap(find.byKey(const Key('addTaskButton')));
        await tester.pump();

        // Add second task
        await tester.enterText(
          find.byKey(const Key('taskTitleField')),
          'Task B',
        );
        await tester.tap(find.byKey(const Key('addTaskButton')));
        await tester.pump();

        // Verify both tasks exist
        expect(find.text('Task A'), findsOneWidget);
        expect(find.text('Task B'), findsOneWidget);

        // Delete first task (tap the first delete icon)
        final deleteButtons = find.byIcon(Icons.delete);
        await tester.tap(deleteButtons.first);
        await tester.pump();

        // Verify only Task B remains
        expect(find.text('Task A'), findsNothing);
        expect(find.text('Task B'), findsOneWidget);
      },
    );

    testWidgets(
      'full flow: add task → navigate to detail → go back without saving → title unchanged',
      (WidgetTester tester) async {
        await tester.pumpWidget(createTestWidget());

        // Add task
        await tester.enterText(
          find.byKey(const Key('taskTitleField')),
          'Keep Me',
        );
        await tester.tap(find.byKey(const Key('addTaskButton')));
        await tester.pump();

        // Navigate to detail
        await tester.tap(find.text('Keep Me'));
        await tester.pumpAndSettle();

        // Edit text but press back instead of Save
        await tester.enterText(
          find.byKey(const Key('detailTitleField')),
          'Changed Title',
        );

        // Navigate back via back button
        await tester.tap(find.byType(BackButton));
        await tester.pumpAndSettle();

        // Verify original title is still there (back without save = no change)
        expect(find.text('Keep Me'), findsOneWidget);
        expect(find.text('Changed Title'), findsNothing);
      },
    );
  });
}
