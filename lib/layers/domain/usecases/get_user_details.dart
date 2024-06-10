import 'package:flutter_with_solid/layers/domain/entity/user.dart';
import 'package:flutter_with_solid/layers/domain/repository/user_repository.dart';

class GetUserDetails {
  GetUserDetails({required UserRepository repository})
      : _repository = repository;
  final UserRepository _repository;

  Future<User> call({required int? id}) async {
    final user = await _repository.getUserDetails(id: id);
    return user;
  }
}
