import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_futureprovider/model/user.dart';
import 'package:learning_futureprovider/service/user_service.dart';


final userDataProvider = FutureProvider<List<User>>(
  (ref) async => ref.watch(apiProvider).getUser(),
);
