import 'package:advice_app/coffee/presentation/bloc/coffee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../weather/presentation/pages/weather_page.dart';


class CoffeePage extends StatelessWidget {
  CoffeePage({Key? key}) : super(key: key);

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
      body: BlocBuilder<CoffeeBloc, CoffeeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is CoffeeInitial)
                    const Text(
                      'Start Searching . . .',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (state is CoffeeLoadingState) const CircularProgressIndicator(),
                  if (state is CoffeeLoadedState)
                    Column(
                      children: [
                        Image(
                            image: NetworkImage(state.coffeeModel.file.toString())),
                      ],
                    ),
                  const SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      context.read<CoffeeBloc>().add(GetRandomCoffeeEvent());
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WeatherPage()));
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
