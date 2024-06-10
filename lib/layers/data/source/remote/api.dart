// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_with_solid/layers/data/dto/user_dto.dart';

abstract class Api {
  Future<List<UserDto>> loadUsers({int page = 0});
  Future<UserDto> loadUserDetails({required int? id});
}

class ApiImpl extends Api {
  final dio = Dio();

  ///
  @override
  Future<List<UserDto>> loadUsers({int page = 0}) async {
    try {
      final Response response = await dio
          .get("https://jsonplaceholder.typicode.com/users/?page=$page");

      final modelledData =
          (response.data as List).map((e) => UserDto.fromMap(e)).toList();

      return modelledData;
    } on DioException {
      return [];
    }
  }

  @override
  Future<UserDto> loadUserDetails({required int? id}) async {
    try {
      final Response response =
          await dio.get("https://jsonplaceholder.typicode.com/users/$id");

      final modelledData = UserDto.fromMap(response.data);

      return modelledData;
    } on DioException {
      rethrow;
    }
  }
}
