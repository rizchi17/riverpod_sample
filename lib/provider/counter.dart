import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'counter.g.dart';

@riverpod
class PageIndex extends _$PageIndex {
  @override
  int build() {
    return 3;
  }

  void goToPreviousPage() {
    state -= 1;
  }

}

@riverpod
bool canGoToPreviousPage(CanGoToPreviousPageRef ref) {
  return ref.watch(pageIndexProvider) != 0;
}

class PreviousButton extends ConsumerWidget {
  const PreviousButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canGoToPreviousPage = ref.watch(canGoToPreviousPageProvider);

    void goToPreviousPage() {
      ref.read(pageIndexProvider.notifier).goToPreviousPage();
    }

    return ElevatedButton(
      onPressed: canGoToPreviousPage ? goToPreviousPage : null,
      child: Text(ref.watch(pageIndexProvider).toString()),
    );
  }
}
