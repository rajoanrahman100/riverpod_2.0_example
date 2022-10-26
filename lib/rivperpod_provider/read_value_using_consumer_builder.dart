import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/main.dart';

class ConsumerBuilder extends StatelessWidget {
  const ConsumerBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Example"),
      ),
      body: Center(child: Consumer(builder: (context, ref, child) {
        final name=ref.watch(nameProvider);
        return Text("$name");
      }),),);

  }
}
