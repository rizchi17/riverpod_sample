import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/async_notifier_provider/async_notifier_provider_controller.dart';

class AsyncNotifierProviderPage extends ConsumerWidget {
  const AsyncNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(asyncNotifierScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AsyncNotifier Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            state.when(
              data: (data) => Text(data.toString()),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            label: const Icon(Icons.add),
            heroTag: 'get',
            onPressed: () {
              ref
                  .read(asyncNotifierScreenControllerProvider.notifier)
                  .setNewWord();
            },
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton.extended(
            label: const Icon(Icons.delete),
            heroTag: 'delete',
            onPressed: () {
              ref
                  .read(asyncNotifierScreenControllerProvider.notifier)
                  .deleteWord();
            },
          ),
        ],
      ),
    );
  }
}
