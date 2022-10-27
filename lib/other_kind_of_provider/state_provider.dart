import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// StateProvider is great for storing simple state objects that can change, such as a counter value
///

final stateProvider = StateProvider<int>(((ref) {
  return 0;
}));

class CounterApp extends ConsumerWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(stateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Provider"),
        actions: [
          IconButton(onPressed: (){
            //To reset the value of Counter
            ref.invalidate(stateProvider);//Or
            ref.refresh(stateProvider);
          }, icon: const Icon(Icons.restore))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "$counter",
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(stateProvider.notifier).state++;
                },
                child: Text("Click"))
          ],
        ),
      ),
    );
  }
}
