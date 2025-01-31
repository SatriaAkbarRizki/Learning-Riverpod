import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User(
      {required String id,
      required String email,
      required String first_name,
      required String last_name,
      required String avatar}) = _User;

  factory User.fromJson(Map<String, Object?> user) => _$UserFromJson(user);
}
