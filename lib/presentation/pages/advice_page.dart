import 'package:advice_app/presentation/pages/coffee_page.dart';
import 'package:flutter/material.dart';
import '../../data/datasource/advice_ds.dart';
import '../../data/model/advice_modle.dart';
class AdvicePage extends StatefulWidget {
  AdvicePage({Key? key}) : super(key: key);
  @override
  State<AdvicePage> createState() => _AdvicePageState();
}
class _AdvicePageState extends State<AdvicePage> {
  bool loading = false;
  AdviceModel? nt;
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(nt == null && !loading) const  Text(
                'Start Searching . . .',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if(loading) const CircularProgressIndicator(),
              if(nt!=null && !loading)
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
                        nt!.advice.toString(),
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
                  setState(() {
                    loading=true ;
                  });
                  nt =  await AdviceImp().getAdvice() ;
                  setState(() {
                    loading=false;
                  });
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CoffeePage())) ;
        },
        child: Icon(Icons.arrow_forward),
      ),

    );
  }
}
