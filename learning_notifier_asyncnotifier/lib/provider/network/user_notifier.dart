import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learning_notifier_asyncnotifier/model/user.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNetwork extends _$UserNetwork {
  final apiUrl = "https://.....mockapi.io/User";

  @override
  Future<List<User>> build() async {
    return await fetchUsers();
  }

  Future<List<User>> fetchUsers() async {
    final respons = await http.get(Uri.parse(apiUrl));
    List<dynamic> result = jsonDecode(respons.body);

    return result
        .map(
          (e) => User.fromJson(e),
        )
        .toList();
  }

  Future updateUser(User user) async {
    state = AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await http.put(
          Uri.parse(
              "https://....mockapi.io/User/${user.id}"),
          body: user.toJson());
      return fetchUsers();
    });
  }
}
