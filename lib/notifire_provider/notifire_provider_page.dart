import 'package:flutter/material.dart';
import 'package:riverpod_sample/notifire_provider/up_down_counter.dart';

class NotifireProviderPage extends StatelessWidget {
  const NotifireProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifire Provider'),
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
