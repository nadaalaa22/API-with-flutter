part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}
class GetWeatherByCity extends WeatherEvent {
 final String city ;

  GetWeatherByCity({required this.city});
}
