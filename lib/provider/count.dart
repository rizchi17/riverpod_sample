import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'count.g.dart';

@riverpod
class Count extends _$Count {
  @override
  int build() {
    return 3;
  }

  void decrease() {
    state -= 1;
  }

}

@riverpod
bool canDecrease(CanDecreaseRef ref) {
  return ref.watch(countProvider) != 0;
}

class DecreaseButton extends ConsumerWidget {
  const DecreaseButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canGoToPreviousPage = ref.watch(canDecreaseProvider);

    void decrease() {
      ref.read(countProvider.notifier).decrease();
    }

    return ElevatedButton(
      onPressed: canGoToPreviousPage ? decrease : null,
      child: Text(ref.watch(countProvider).toString()),
    );
  }
}
