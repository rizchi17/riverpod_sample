import 'package:flutter/material.dart';
import 'package:riverpod_sample/provider/counter.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('Down count'),
              ),
              PreviousButton()
            ],
          ),
        ),
      ),
    );
  }
}
