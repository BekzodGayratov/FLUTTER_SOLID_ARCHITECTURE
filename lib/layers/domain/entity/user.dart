import 'package:equatable/equatable.dart';
import 'package:flutter_with_solid/layers/domain/entity/address.dart';
import 'package:flutter_with_solid/layers/domain/entity/company.dart';

class User with EquatableMixin {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  User(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

  @override
  List<Object?> get props => [];
}
