import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_notifier_asyncnotifier/provider/counter.dart';

class HomeCounter extends ConsumerWidget {
  const HomeCounter({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('$counter')],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).decrement();
              },
              child: Icon(Icons.remove)),
          ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).add5number();
              },
              child: Icon(Icons.merge)),
          ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              child: Icon(Icons.add))
        ],
      ),
    );
  }
}
