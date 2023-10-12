import 'package:flutter/material.dart';

import '../../data/datasource/weather_ds.dart';
import '../../data/model/weather_model.dart';


class WeatherPage extends StatefulWidget {
  WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  var name = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool loading = false;

  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Weather',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(weatherModel == null && !loading) const  Text(
                  'Start Searching . . .',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if(loading) const CircularProgressIndicator(),
                if(weatherModel!=null && !loading)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                         'Temperature is : ${weatherModel!.temperature}' ,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                            'Wind is : ${weatherModel!.wind} ',
                            style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                            'Description is :  ${weatherModel!.description}' ,
                            style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 80,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: name,
                          decoration: const InputDecoration(
                            hintText: 'Enter a  name of any city ',
                            border: OutlineInputBorder(),
                          ),
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Field cannot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  loading=true ;
                                });
                                weatherModel =  await WeatherImp().getWeather(name.text) ;
                                setState(() {
                                  loading=false;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8), // Adjust the border radius as needed
                              ),
                            ),
                            child: const Text('Search'),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
