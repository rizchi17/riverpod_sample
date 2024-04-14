import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/notifire_provider/up_down_count.dart';

class UpDownCounter extends ConsumerWidget {
  const UpDownCounter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upDownCount = ref.watch(upDownCountProvider);

    return Column(
      children: [
        const Text('up down counter'),
        Text(upDownCount.toString()),
        FilledButton(
          onPressed: () {
            ref.read(upDownCountProvider.notifier).decrease();
          },
          child: const Text('-'),
        ),
        FilledButton(
          onPressed: () {
            ref.read(upDownCountProvider.notifier).increase();
          },
          child: const Text('+'),
        ),
      ],
    );
  }
}
