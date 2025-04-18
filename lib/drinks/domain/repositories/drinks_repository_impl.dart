import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/drinks/data/models/drinks_model.dart';
import 'package:flutter_application_1/drinks/data/repositories/drinks_repository.dart';

class DrinkRepositoryImpl implements DrinkRepository {
  @override
  Future<Drink> getDrink(String name) async {
    final Dio dio = Dio();
    try {
      final res = await dio.get(
          "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$name");

      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['drinks'] != null && data['drinks'].isNotEmpty) {
          return Drink.fromJson(data['drinks'][0]);
        }
        throw Exception('Drink not found');
      }
      throw Exception('Failed to load drink');
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch drink: $e');
    }
  }
}
