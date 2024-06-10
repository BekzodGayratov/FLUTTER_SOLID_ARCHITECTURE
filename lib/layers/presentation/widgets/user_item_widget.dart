import 'package:flutter/material.dart';
import 'package:flutter_with_solid/layers/domain/entity/user.dart';

class UserItemWidget extends StatelessWidget {
  final User item;
  final VoidCallback onTap;
  const UserItemWidget({super.key, required this.onTap, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(item.name.toString()),
      subtitle: Text(item.email.toString()),
    );
  }
}
