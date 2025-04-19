import 'package:flutter_application_1/drinks/data/models/drinks_model.dart';

abstract class DrinkRepository {
  Future<List<Drink>> getDrink(String name);
}
