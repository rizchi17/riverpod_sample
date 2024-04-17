import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/state_notifier_provider/state_notifier_conotroller.dart';

class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todosProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifier Screen'),
      ),
      body: ListView(
        children: [
          for (final todo in todos)
            CheckboxListTile(
              value: todo.completed,
              // When tapping on the todo, change its completed status
              onChanged: (value) =>
                  ref.read(todosProvider.notifier).toggle(todo.id),
              title: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ref.read(todosProvider.notifier).removeTodo(todo.id);
                    },
                  ),
                  Text(todo.description)
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final int index = todos.length;
          ref.read(todosProvider.notifier).addTodo(
                Todo(
                  id: index.toString(),
                  description: 'description$index',
                  completed: false,
                ),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
