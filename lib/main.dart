import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/change_notifier_provider/change_notifier_provider_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      // home: ProviderPage(),
      // home: NotifierProviderPage(),
      // home: AsyncNotifierProviderPage(),
      // home: StateNotifierProviderPage(),
      // home: FutureProviderPage(),
      // home: StreamProviderPage(),
      // home: StateProviderPage(),
      home: ChangeNotifierProviderPage(),
    );
  }
}
