import 'package:advice_app/advice/presentation/bloc/advice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../coffee/presentation/pages/coffee_page.dart';
import '../../data/datasource/advice_ds.dart';
import '../../data/model/advice_model.dart';

class AdvicePage extends StatelessWidget {
  AdvicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Advice',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      body: BlocBuilder<AdviceBloc, AdviceState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is AdviceInitial)
                    const Text(
                      'Start Searching . . .',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (state is AdviceLoadingState) const CircularProgressIndicator(),
                  if (state is AdviceLoadedState)
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'The advice is .. ',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            state.adviceModel.advice.toString(),
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      context.read<AdviceBloc>().add(GetRandomAdviceEvent());
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        // Adjust the border radius as needed
                      ),
                    ),
                    child: const Text('Random Advice '),
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
              context, MaterialPageRoute(builder: (context) => CoffeePage()));
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
