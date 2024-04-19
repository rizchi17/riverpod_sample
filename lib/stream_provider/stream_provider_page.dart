import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/stream_provider/stream_screen_controller.dart';

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(streamScreenControllerProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Stream Provider'),
        ),
        body: Center(
          // Riverpod3.0から、whenメソッドではなくて、switchが推奨されるらしいので使ってみる
          child: switch (state) {
            AsyncData(:final value) => Text(value),
            AsyncError(:final error) => Text(error.toString()),
            _ => const CircularProgressIndicator(),
          },
        ));
  }
}
