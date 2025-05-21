import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/provider/sample_provider.dart';

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // この状態は画面がpopされるたびに破棄される
    final randomNumberState = ref.watch(randomNumberProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ランダムな数字が表示される'),
            Text(randomNumberState.toString()),
            ElevatedButton(
                onPressed: () {
                  final _ = ref.refresh(randomNumberProvider);
                },
                child: const Text('数字を更新'))
          ],
        ),
      )),
    );
  }
}
