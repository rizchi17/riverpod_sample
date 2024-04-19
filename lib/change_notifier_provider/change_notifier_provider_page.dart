import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/change_notifier_provider/change_notifier_provider.dart';

class ChangeNotifierProviderPage extends ConsumerWidget {
  const ChangeNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todo list changes
    List<Todo> todos = ref.watch(todosProvider).todos;

    // Let's render the todos in a scrollable list view
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            for (final todo in todos)
              CheckboxListTile(
                value: todo.completed,
                // When tapping on the todo, change its completed status
                onChanged: (value) =>
                    ref.read(todosProvider.notifier).toggle(todo.id),
                title: Text(todo.description),
              ),
            OutlinedButton(
              onPressed: () {
                ref.read(todosProvider.notifier).addTodo(
                      Todo(
                        id: todos.length.toString(),
                        description: 'description',
                        completed: false,
                      ),
                    );
              },
              child: const Text('add'),
            )
          ],
        ),
      ),
    );
  }
}
