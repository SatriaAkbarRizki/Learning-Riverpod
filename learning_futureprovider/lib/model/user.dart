import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
      {required String id,  
      required String email,  
      required String first_name,
      required String last_name,
      required String avatar}) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
