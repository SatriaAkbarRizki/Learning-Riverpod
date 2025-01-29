import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_futureprovider/model/user.dart';
import 'package:learning_futureprovider/service/user_service.dart';

final apiProvider = Provider(
  (ref) => ApiService(),
);

final userDataProvider = FutureProvider.autoDispose<List<User>>(
  (ref) async => ref.watch(apiProvider).getUser(),
);
