import 'package:equatable/equatable.dart';
import 'package:flutter_with_solid/layers/domain/entity/user.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_with_solid/layers/domain/usecases/get_users.dart';
part 'user_page_state.dart';

class UserPageCubit extends Cubit<UserPageState> {
  UserPageCubit({required GetUsers getUsers})
      : _getUsers = getUsers,
        super(const UserPageState());

  final GetUsers _getUsers;

  Future<void> getUsers() async {

    if (state.hasReachedEnd) return;

    emit(state.copyWith(status: UserPageStatus.loading));

    final list = await _getUsers.call(page: 0);

    emit(state.copyWith(
        status: UserPageStatus.success,
        hasReachedEnd: list.isEmpty,
        currentPage: state.currentPage + 1,
        users: List.of(state.users)..addAll(list)));
  }
}
