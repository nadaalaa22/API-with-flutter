class WeatherModel {
  final String temperature ,wind , description ;

  WeatherModel({required this.temperature, required this.wind, required this.description});



  factory WeatherModel.fromMap(Map map) => WeatherModel(
    temperature: map['temperature'],
    wind: map['wind'],
    description: map['description'],


  );


}