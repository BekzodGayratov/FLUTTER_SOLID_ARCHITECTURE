import 'dart:convert';

import 'package:flutter_with_solid/layers/domain/entity/geo.dart';

class GeoDto extends Geo {
  GeoDto({super.lat, super.lng});

  //----------------------------------------------------------------------------
  // JSON
  //----------------------------------------------------------------------------

  factory GeoDto.fromRawJson(String str) => GeoDto.fromMap(jsonDecode(str));

  //----------------------------------------------------------------------------
  // MAP
  //----------------------------------------------------------------------------

  factory GeoDto.fromMap(Map<String, dynamic> json) =>
      GeoDto(lat: json['lat'], lng: json['lng']);

  Map<String, dynamic> toMap() => {
    'lat': lat,
    'lng': lng,
  };
  //----------------------------------------------------------------------------
  // DOMAIN
  //----------------------------------------------------------------------------

  static GeoDto fromGeo(Geo geo) => GeoDto(lat: geo.lat, lng: geo.lng);

  Geo toGeo() => Geo(lat: lat, lng: lng);
}
