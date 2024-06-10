import 'package:equatable/equatable.dart';

class Company with EquatableMixin {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  @override
  List<Object?> get props => [name, catchPhrase, bs];
}

