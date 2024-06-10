import 'package:flutter/material.dart';

class UserListItemLoading extends StatelessWidget {
  const UserListItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
