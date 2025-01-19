import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/async_notifier_provider/async_notifier_provider_page.dart';
import 'package:riverpod_sample/change_notifier_provider/change_notifier_provider_page.dart';
import 'package:riverpod_sample/future_provider/future_provider_page.dart';
import 'package:riverpod_sample/notifier_provider/notifier_provider_page.dart';
import 'package:riverpod_sample/provider/provider_page.dart';
import 'package:riverpod_sample/state_notifier_provider/state_notifier_provider_page.dart';
import 'package:riverpod_sample/state_provider/state_provider_page.dart';
import 'package:riverpod_sample/stream_provider/stream_provider_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      home: TopPage(),
    );
  }
}

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> providers = [
      const ProviderPage(),
      const NotifierProviderPage(),
      const AsyncNotifierProviderPage(),
      const StateProviderPage(),
      const StateNotifierProviderPage(),
      const FutureProviderPage(),
      const StreamProviderPage(),
      const ChangeNotifierProviderPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Provider比較'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: providers
            .map(
              (e) => ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => e),
                  );
                },
                child: Text(e.toString()),
              ),
            )
            .toList(),
      )),
    );
  }
}
