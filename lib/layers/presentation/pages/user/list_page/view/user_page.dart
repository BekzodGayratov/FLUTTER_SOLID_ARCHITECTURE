import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_solid/layers/domain/usecases/get_users.dart';
import 'package:flutter_with_solid/layers/presentation/pages/user/list_page/cubit/user_page_cubit.dart';
import 'package:flutter_with_solid/layers/presentation/widgets/item_loading_widget.dart';
import 'package:flutter_with_solid/layers/presentation/widgets/user_item_widget.dart';

//------------------------------------------------------------------------------
// PAGE
//------------------------------------------------------------------------------

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserPageCubit(getUsers: context.read<GetUsers>())..getUsers(),
      child: const UserView(),
    );
  }
}

//------------------------------------------------------------------------------
// VIEW
//------------------------------------------------------------------------------
class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((UserPageCubit c) => c.state.status);
    return status == UserPageStatus.initial
        ? const Center(child: CircularProgressIndicator.adaptive())
        : const _Content();
  }
}

//------------------------------------------------------------------------------
// CONTENT
//------------------------------------------------------------------------------

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  final _scrollController = ScrollController();

  UserPageCubit get pageCubit => context.read<UserPageCubit>();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext ctx) {
    final list = ctx.select((UserPageCubit b) => b.state.users);
    final hasEnded = ctx.select((UserPageCubit b) => b.state.hasReachedEnd);
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ListView.builder(
            key: const ValueKey('character_page_list_key'),
            controller: _scrollController,
            itemCount: hasEnded ? list.length : list.length + 1,
            itemBuilder: (context, index) {
              if (index >= list.length) {
                return !hasEnded
                    ? const UserListItemLoading()
                    : const SizedBox.shrink();
              }
              final item = list[index];

              return UserItemWidget(onTap: () {}, item: item);
            }));
  }

  //  void _goToDetails(User user) {
  //   final route = CharacterDetailsPage.route(character: character);
  //   Navigator.of(context).push(route);
  // }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      pageCubit.getUsers();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class CharacterPageCubit {}
