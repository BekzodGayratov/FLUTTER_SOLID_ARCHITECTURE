import 'package:flutter_with_solid/layers/data/source/remote/api.dart';
import 'package:flutter_with_solid/layers/domain/entity/user.dart';
import 'package:flutter_with_solid/layers/domain/repository/user_repository.dart';

class UserRepositoryImp extends UserRepository {
  final Api _api;

  UserRepositoryImp({required Api api}) : _api = api;
  @override
  Future<List<User>> getUsers({int page = 0}) async {
    final fetchedUsers = await _api.loadUsers(page: page);
    return fetchedUsers;
  }

  @override
  Future<User> getUserDetails({required int? id}) async {
    final fetchedUser = await _api.loadUserDetails(id: id);
    return fetchedUser;
  }
}
