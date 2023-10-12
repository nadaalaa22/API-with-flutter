import 'dart:convert';
import 'package:http/http.dart';

import '../model/coffee_model.dart';

abstract class CoffeeRemoteDS {
  ///
  /// throw an error
  Future<CoffeeModel> getImageOfCoffee();

}
class CoffeeImp implements CoffeeRemoteDS {

  @override
  Future<CoffeeModel> getImageOfCoffee() async {
    var url = Uri.parse('https://coffee.alexflipnote.dev/random.json');
    var response = await get(url);
    if (response.statusCode > 199 && response.statusCode < 300) {
      print(response.body);
      return CoffeeModel.fromMap(jsonDecode(response.body));
    }
    else {
      throw Exception('Failed to load coffee image');
    }
  }
}

