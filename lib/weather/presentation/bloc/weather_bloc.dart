import 'dart:async';

import 'package:advice_app/weather/data/datasource/weather_ds.dart';
import 'package:advice_app/weather/data/model/weather_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is GetWeatherByCity) {
        emit(WeatherLoadingState());
        WeatherModel weatherModel =
            await WeatherImp().getWeather(event.city);
        emit(WeatherLoadedState(weatherModel: weatherModel));
      }
    });
  }
}
