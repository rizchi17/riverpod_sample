import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/state_provider/text_state_provider.dart';

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
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            width: 300,
            child: TextField(
              controller: textEditingController,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(textProvider.notifier).state = textEditingController.text;
              },
              child: const Text('update'))
        ],
      )),
    );
  }
}
