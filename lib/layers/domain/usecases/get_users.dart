import 'package:flutter_with_solid/layers/domain/entity/user.dart';
import 'package:flutter_with_solid/layers/domain/repository/user_repository.dart';

class GetUsers {
  GetUsers({required UserRepository repository}) : _repository = repository;

  final UserRepository _repository;

  Future<List<User>> call({int page = 0}) async {
    final list = await _repository.getUsers(page: page);
    return list;
  }
}
