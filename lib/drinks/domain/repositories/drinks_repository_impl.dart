import 'package:dio/dio.dart';
import 'package:flutter_application_1/drinks/data/models/drinks_model.dart';
import 'package:flutter_application_1/drinks/data/repositories/drinks_repository.dart';

class DrinkRepositoryImpl implements DrinkRepository {
  @override
  Future<List<Drink>> getDrink(String name) async {
    final Dio dio = Dio();
    try {
      final res = await dio.get(
          "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$name");

      if (res.statusCode == 200) {
        final data = res.data as Map<String, dynamic>;
        if (data['drinks'] != null) {
          return (data['drinks'] as List)
              .map((json) => Drink.fromJson(json))
              .toList();
        }
        return []; // Возвращаем пустой список, если напитков нет
      }
      throw Exception('Failed to load drinks');
    } catch (e) {
      throw Exception('Failed to fetch drinks: $e');
    }
  }
}
