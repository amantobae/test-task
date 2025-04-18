part of 'drinks_bloc.dart';

@immutable
sealed class DrinksEvent {}

class GetDrinkEvent extends DrinksEvent {
  final String name;

  GetDrinkEvent({required this.name});
}
