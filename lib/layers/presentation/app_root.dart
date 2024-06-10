import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_solid/layers/data/source/remote/api.dart';
import 'package:flutter_with_solid/layers/data/user_repository_impl.dart';
import 'package:flutter_with_solid/layers/domain/usecases/get_user_details.dart';
import 'package:flutter_with_solid/layers/domain/usecases/get_users.dart';
import 'package:flutter_with_solid/layers/presentation/pages/user/list_page/view/user_page.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late GetUsers _getUsers;
  @override
  void initState() {
    final api = ApiImpl();
    final repo = UserRepositoryImp(api: api);
    _getUsers = GetUsers(repository: repo);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text("User App"),
          ),
          body: RepositoryProvider.value(
              value: _getUsers, child: const UserPage())),
    );
  }
}
