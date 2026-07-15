import 'dart:core';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_course/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      final response = await dio.get('character');
      if (response.statusCode == 200) {
        final charactersMap = response.data;
        final List<dynamic> charactersList = charactersMap['results'] ?? [];
        return charactersList;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
