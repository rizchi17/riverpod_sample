import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/state_provider/state_provider_controller.dart';

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(textProvider);
    final textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
          child: Column(
        children: [
          Text(text),
          TextField(
            controller: textEditingController,
          ),
          OutlinedButton(
              onPressed: () {
                ref.read(textProvider.notifier).state =
                    textEditingController.text;
              },
              child: const Text('update'))
        ],
      )),
    );
  }
}
