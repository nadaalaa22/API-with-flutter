
import 'package:advice_app/coffee/data/datasource/coffee_ds.dart';
import 'package:advice_app/coffee/data/model/coffee_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc() : super(CoffeeInitial()) {
    on<CoffeeEvent>((event, emit) async {
      if (event is GetRandomCoffeeEvent) {
        emit(CoffeeLoadingState());
        CoffeeModel coffeeModel =
            await CoffeeImp().getImageOfCoffee() ;
        emit(CoffeeLoadedState(coffeeModel: coffeeModel));
      }
    });
  }
}
