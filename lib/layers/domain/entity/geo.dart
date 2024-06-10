import 'package:equatable/equatable.dart';

class Geo with EquatableMixin {
  final String? lat;
  final String? lng;

  Geo({this.lat, this.lng});

  @override
  List<Object?> get props => [lat, lng];
}
