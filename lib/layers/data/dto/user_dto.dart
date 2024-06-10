import 'dart:convert';

import 'package:flutter_with_solid/layers/data/dto/address_dto.dart';
import 'package:flutter_with_solid/layers/data/dto/company_dto.dart';
import 'package:flutter_with_solid/layers/domain/entity/user.dart';

class UserDto extends User {
  UserDto(
      {super.id,
      super.name,
      super.username,
      super.email,
      super.address,
      super.company,
      super.phone,
      super.website});

  //----------------------------------------------------------------------------
  // JSON
  //----------------------------------------------------------------------------

  factory UserDto.fromRawJson(String str) => UserDto.fromMap(jsonDecode(str));

  //----------------------------------------------------------------------------
  // MAP
  //----------------------------------------------------------------------------

  factory UserDto.fromMap(Map<String, dynamic> json) => UserDto(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: json["address"] != null
            ? AddressDto.fromMap(json['address'])
            : null,
        company: json["company"] != null
            ? CompanyDto.fromMap(json["company"])
            : null,
        phone: json["phone"],
        website: json["website"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address":
            address != null ? AddressDto.fromAddress(address!).toMap() : null,
        "company":
            company != null ? CompanyDto.fromCompany(company!).toMap() : null,
        "phone": phone,
        "website": website,
      };
}
