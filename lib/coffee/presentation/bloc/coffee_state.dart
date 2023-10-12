part of 'coffee_bloc.dart';

@immutable
abstract class CoffeeState {}

class CoffeeInitial extends CoffeeState {}
class CoffeeLoadingState extends CoffeeState {}
class CoffeeLoadedState extends CoffeeState {
  final CoffeeModel coffeeModel ;

  CoffeeLoadedState({required this.coffeeModel});

}
