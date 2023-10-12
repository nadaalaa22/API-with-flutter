import 'package:advice_app/data/datasource/coffee_ds.dart';
import 'package:advice_app/presentation/pages/weather_page.dart';
import 'package:flutter/material.dart';
import '../../data/datasource/advice_ds.dart';
import '../../data/model/coffee_model.dart';
class CoffeePage extends StatefulWidget {
  CoffeePage({Key? key}) : super(key: key);
  @override
  State<CoffeePage> createState() => _CoffeePageState();
}
class _CoffeePageState extends State<CoffeePage> {
  bool loading = false;
  CoffeeModel? coffeeModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          ' Random Coffee Image',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(coffeeModel == null && !loading) const  Text(
                'Start Searching . . .',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if(loading) const CircularProgressIndicator(),
              if(coffeeModel!=null && !loading)
                Column(
                  children: [
                   Image(image: NetworkImage(coffeeModel!.file.toString())),

                  ],
                ),
              const SizedBox(
                height: 80,
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    loading=true ;
                  });
                  coffeeModel =  await CoffeeImp().getImageOfCoffee() ;
                  setState(() {
                    loading=false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Random coffee image '),
              ),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> WeatherPage())) ;

    },

          child: Icon(Icons.arrow_forward),
        ),
    );
  }
}
