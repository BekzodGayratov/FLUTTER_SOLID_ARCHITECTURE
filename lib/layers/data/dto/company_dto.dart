import 'dart:convert';

import 'package:flutter_with_solid/layers/domain/entity/company.dart';

class CompanyDto extends Company {
  CompanyDto({super.name, super.catchPhrase, super.bs});

  //----------------------------------------------------------------------------
  // JSON
  //----------------------------------------------------------------------------

  factory CompanyDto.fromRawJson(String str) =>
      CompanyDto.fromMap(jsonDecode(str));

  //----------------------------------------------------------------------------
  // MAP
  //----------------------------------------------------------------------------

  factory CompanyDto.fromMap(Map<String, dynamic> json) => CompanyDto(
      name: json['name'], catchPhrase: json['catchPhrase'], bs: json['bs']);

  Map<String, dynamic> toMap() =>
      {'name': name, 'catchPhrase': catchPhrase, 'bs': bs};

  //----------------------------------------------------------------------------
  // DOMAIN
  //----------------------------------------------------------------------------

  static CompanyDto fromCompany(Company company) => CompanyDto(
      bs: company.bs, name: company.name, catchPhrase: company.catchPhrase);

  Company toCompany() => Company(bs: bs, name: name, catchPhrase: catchPhrase);
}
