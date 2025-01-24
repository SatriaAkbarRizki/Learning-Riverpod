import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider<int>(
  (ref) => 0,
);

final counterStateCombine = StateProvider<int>(
  (ref) => 5,
);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, child) {
              var value = ref.watch(
                  counterStateProvider); // Ini yang membuat widget rebuild semua nya, jadi lebih baik masukkin ke scope consumer agar rebuild widget tertentu
              return Text("Number: $value");
            })
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  ref.read(counterStateProvider.notifier).state--;
                },
                icon: Icon(Icons.remove)),
            IconButton(
                onPressed: () {
                  // Kombinasi 2 state
                  ref.watch(counterStateProvider.notifier).state =
                      ref.watch(counterStateProvider.notifier).state +
                          ref.watch(counterStateCombine.notifier).state;
                },
                icon: Icon(Icons.merge)),
            IconButton(
                onPressed: () {
                  ref.read(counterStateProvider.notifier).state++;
                },
                icon: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
