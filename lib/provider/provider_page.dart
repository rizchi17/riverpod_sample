import 'package:flutter/material.dart';
import 'package:riverpod_sample/provider/count.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Notifire Provider'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('down counter'),
              DecreaseButton(),
            ],
          ),
        ),
      ),
    );
  }
}
