import 'package:json_annotation/json_annotation.dart';
import 'team.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User(this.id, this.email, this.name, this.picture, this.gender, this.rollNo,
      this.phoneNo, this.teamId, this.createdAt, this.updatedAt);

  String id;
  String email;
  String name;
  String picture;
  String? gender;
  String? rollNo;
  String? phoneNo;
  String? teamId;
  String createdAt;
  String updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
