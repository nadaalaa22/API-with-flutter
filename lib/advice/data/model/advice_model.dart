class AdviceModel {
  final String advice ;
  final int id ;

  AdviceModel({required this.advice, required this.id});

  factory AdviceModel.fromMap(Map map) => AdviceModel(
     advice: map['slip']['advice'],
      id : map['slip']['id'],

  );

}