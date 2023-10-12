import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' ;
import '../model/weather_model.dart';

abstract class WeatherRemoteDS {
  ///
  ///
  /// throw an error
  Future<WeatherModel> getWeather(String city);

}
class WeatherImp implements WeatherRemoteDS{
  @override
  Future<WeatherModel> getWeather(String city)async {
    var url = Uri.parse('https://goweather.herokuapp.com/weather/$city') ;
    var response = await get(url,
        headers: {HttpHeaders.contentTypeHeader : 'application/json'}) ;
    if(response.statusCode>199 && response.statusCode<300)
    {

      return  WeatherModel.fromMap(jsonDecode(response.body));
    }
    else
    {
      print('error with status : ${response.statusCode}') ;
      throw Exception('api failed');
    }

  }

}