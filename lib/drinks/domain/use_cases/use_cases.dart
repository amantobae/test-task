import 'package:flutter_application_1/drinks/data/models/drinks_model.dart';
import 'package:flutter_application_1/drinks/data/repositories/drinks_repository.dart';

class DrinkUseCases {
  final DrinkRepository drinkRepository;

  DrinkUseCases({required this.drinkRepository});

  Future<List<Drink>> getDrink(String name) async =>
      await drinkRepository.getDrink(name);
}
