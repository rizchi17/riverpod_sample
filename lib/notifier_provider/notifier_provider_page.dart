import 'package:flutter/material.dart';
import 'package:riverpod_sample/notifier_provider/up_down_counter.dart';

class NotifierProviderPage extends StatelessWidget {
  const NotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifier Provider'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: const UpDownCounter(),
        ),
      ),
    );
  }
}
