import 'dart:convert';

import 'package:flutter_with_solid/layers/data/dto/geo_dto.dart';
import 'package:flutter_with_solid/layers/domain/entity/address.dart';

class AddressDto extends Address {
  AddressDto({super.city, super.geo, super.street, super.suite, super.zipcode});

  //----------------------------------------------------------------------------
  // JSON
  //----------------------------------------------------------------------------

  factory AddressDto.fromRawJson(String str) =>
      AddressDto.fromMap(jsonDecode(str));
  //----------------------------------------------------------------------------
  // MAP
  //----------------------------------------------------------------------------

  factory AddressDto.fromMap(Map<String, dynamic> json) => AddressDto(
        city: json['city'],
        geo: GeoDto.fromMap(json['geo']),
        street: json['street'],
        suite: json['suite'],
        zipcode: json['zipcode'],
      );

  Map<String, dynamic> toMap() => {
        'city': city,
        'geo': geo != null ? GeoDto.fromGeo(geo!).toMap() : null,
        'street': street,
        'suite': suite,
        'zipcode': zipcode,
      };

  //----------------------------------------------------------------------------
  // DOMAIN
  //----------------------------------------------------------------------------

  static AddressDto fromAddress(Address address) => AddressDto(
      city: address.city,
      geo: address.geo,
      suite: address.suite,
      zipcode: address.zipcode,
      street: address.street);

  Address toAddress(Address address) => Address(
        city: address.city,
        geo: address.geo,
        suite: address.suite,
        zipcode: address.zipcode,
        street: address.street,
      );
}
