import 'package:flutter/material.dart';
import '../models/task.dart';
import '../repositories/task_repository.dart';
import 'task_detail_screen.dart';

class TaskListScreen extends StatefulWidget {
  final TaskRepository repository;

  const TaskListScreen({super.key, required this.repository});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TextEditingController _textController = TextEditingController();
  int _idCounter = 0;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _addTask() {
    final title = _textController.text.trim();
    if (title.isNotEmpty) {
      setState(() {
        _idCounter++;
        widget.repository.addTask(Task(id: 'task_$_idCounter', title: title));
        _textController.clear();
      });
    }
  }

  void _navigateToDetail(Task task) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            TaskDetailScreen(task: task, repository: widget.repository),
      ),
    );
    // Refresh list after returning from detail screen
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tasks = widget.repository.tasks;

    return Scaffold(
      appBar: AppBar(title: const Text('Taskly')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    key: const Key('taskTitleField'),
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'Enter task title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  key: const Key('addTaskButton'),
                  onPressed: _addTask,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: tasks.isEmpty
                ? const Center(child: Text('No tasks yet. Add one!'))
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return ListTile(
                        key: Key('task_item_${task.id}'),
                        title: Text(task.title),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              widget.repository.deleteTask(task.id);
                            });
                          },
                        ),
                        onTap: () => _navigateToDetail(task),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
