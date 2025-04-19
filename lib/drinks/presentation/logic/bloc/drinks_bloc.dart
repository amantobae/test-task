import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/drinks/data/models/drinks_model.dart';
import 'package:flutter_application_1/drinks/domain/use_cases/use_cases.dart';
import 'package:meta/meta.dart';

part 'drinks_event.dart';
part 'drinks_state.dart';

class DrinksBloc extends Bloc<DrinksEvent, DrinksState> {
  final DrinkUseCases drinkUseCases;

  DrinksBloc({required this.drinkUseCases}) : super(DrinksInitialState()) {
    on<GetDrinkEvent>(
      (event, emit) async {
        try {
          final List<Drink> drinks = await drinkUseCases.getDrink(event.name);
          emit(DrinksLoadedState(drink: drinks)); // Передаем список
        } catch (e) {
          emit(DrinksErrorState());
        }
      },
    );
  }
}
