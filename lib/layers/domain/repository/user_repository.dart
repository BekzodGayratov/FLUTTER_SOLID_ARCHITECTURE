import 'package:flutter_with_solid/layers/domain/entity/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers({int page = 0});

  Future<User> getUserDetails({required int? id});
}
