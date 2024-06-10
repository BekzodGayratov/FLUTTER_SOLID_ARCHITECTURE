import 'package:equatable/equatable.dart';
import 'package:flutter_with_solid/layers/domain/entity/geo.dart';

class Address with EquatableMixin {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  @override
  List<Object?> get props => [street, suite, city, zipcode, geo];
}
