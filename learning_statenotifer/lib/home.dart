import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_statenotifer/riverpod/person_provider.dart';

class HomeScreen extends ConsumerWidget {
  final nameController = TextEditingController();
  
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Rebuild Widget");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, child) {
              final person = ref.watch(personProvider);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text("Name: ${person.name}"),
                  Text("Age: ${person.age}")
                ],
              );
            }),
            Padding(
              padding: const EdgeInsets.all(50),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                ElevatedButton(
                    onPressed: () {
                      ref
                          .read(personProvider.notifier)
                          .changeName(nameController.text);
                    },
                    child: Text("Update Name")),
                ElevatedButton(
                    onPressed: () {
                      ref.read(personProvider.notifier).changeAge();
                    },
                    child: Text("Update Age"))
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  ref.invalidate(personProvider);
                },
                child: Text("Reset State Provider"))
          ],
        ),
      ),
    );
  }
}
