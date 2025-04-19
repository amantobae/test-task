part of 'drinks_bloc.dart';

@immutable
sealed class DrinksState {}

final class DrinksInitialState extends DrinksState {}

class DrinksLoadedState extends DrinksState {
  final List<Drink> drink;

  DrinksLoadedState({required this.drink});
}

class DrinksErrorState extends DrinksState {}

