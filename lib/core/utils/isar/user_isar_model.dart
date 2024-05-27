import 'package:isar/isar.dart';

part 'user_isar_model.g.dart';

@collection
class User {
  final Id isarId = 0;
  int? id;
  String? uid;
  int? orgId;
  String? username;
  String? token;
  String? refresh;
  String? firstName;
  String? lastName;
  String? role;
}