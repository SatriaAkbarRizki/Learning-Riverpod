import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_statenotifer/model/person.dart';

class PersonNotifier extends StateNotifier<Person> {
  PersonNotifier() : super(Person(name: "No name", age: 0));

  void changeName(String name) => state = state.copyWith(name: name);
  void changeAge() => state = state.copyWith(age: state.age + 1);
}

final personProvider = StateNotifierProvider<PersonNotifier, Person>(
  (ref) => PersonNotifier(),
);
