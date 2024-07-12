import 'package:hive_flutter/hive_flutter.dart';

part 'db_model.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String password;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String phoneNumber;

  @HiveField(4)
  final String profession;

  User({
    required this.name,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.profession,
  });
}
