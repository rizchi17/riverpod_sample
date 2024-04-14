import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/async_notifire_provider/async_notifire_provider.dart';
import 'package:riverpod_sample/notifire_provider/notifire_provider_page.dart';
import 'package:riverpod_sample/provider/provider_page.dart';

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
      home: NotifireProviderPage(),
      // home: AsyncNotifireProviderPage(),
    );
  }
}
