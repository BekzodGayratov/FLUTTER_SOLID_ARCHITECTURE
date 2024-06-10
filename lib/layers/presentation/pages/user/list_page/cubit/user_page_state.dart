
part of 'user_page_cubit.dart';
enum UserPageStatus { initial, loading, success, failure }

class UserPageState extends Equatable {
  const UserPageState({
    this.status = UserPageStatus.initial,
    this.users = const [],
    this.hasReachedEnd = false,
    this.currentPage = 0,
  });

  //----------------------------------------------------------------------------
  // properties
  //----------------------------------------------------------------------------

  final UserPageStatus status;
  final List<User> users;
  final bool hasReachedEnd;
  final int currentPage;

  //----------------------------------------------------------------------------
  // copyWith
  //----------------------------------------------------------------------------

  UserPageState copyWith(
      {UserPageStatus? status,
      List<User>? users,
      bool? hasReachedEnd,
      int? currentPage}) {
    return UserPageState(
      status: status ?? this.status,
      users: users ?? this.users,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [status, users, hasReachedEnd, currentPage];
}
