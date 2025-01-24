import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_futureprovider/model/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final url = "https://658d23df7c48dce9473892eb.mockapi.io/User";

  Future<List<User>> getUser() async {
    final respons = await http.get(Uri.parse(url));
    if (respons.statusCode == 200) {
      List<dynamic> result = jsonDecode(respons.body);
      return result
          .map(
            (e) => User.fromJson(e),
          )
          .toList();
    } else {
      throw Exception(respons.reasonPhrase);
    }
  }

  Future update(User user) async {
    final respons = await http.put(
        Uri.parse(
            "https://658d23df7c48dce9473892eb.mockapi.io/User/${user.id}"),
        body: user.toJson());
    if (respons.statusCode == 200) {
      return true;
    } else {
      throw Exception(respons.reasonPhrase);
    }
  }
}

final apiProvider = StateProvider(
  (ref) => ApiService(),
);
