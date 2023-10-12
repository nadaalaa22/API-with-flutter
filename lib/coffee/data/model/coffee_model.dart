class CoffeeModel {
  final dynamic file ;

  CoffeeModel({required this.file});

  factory CoffeeModel.fromMap(Map map) => CoffeeModel(
    file: map['file'],

  );



}