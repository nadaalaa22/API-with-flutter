import 'dart:convert';
import 'package:http/http.dart';
import '../model/advice_modle.dart';

abstract class AdviceRemoteDS {
  ///
  /// throw an error
  Future<AdviceModel> getAdvice();

}
class AdviceImp implements AdviceRemoteDS{

  @override
  Future<AdviceModel> getAdvice() async {
    var url = Uri.parse('https://api.adviceslip.com/advice') ;
    var response = await get(url) ;
    if(response.statusCode>199 && response.statusCode<300)
    {

      print('from get');
      print(response.body);
      return  AdviceModel.fromMap(jsonDecode(response.body));
    }
    else
    {
      print('error with status : ${response.statusCode}') ;
      throw Exception('api failed');
    }

  }




}