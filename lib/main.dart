import 'package:advice_app/advice/presentation/bloc/advice_bloc.dart';
import 'package:advice_app/coffee/presentation/bloc/coffee_bloc.dart';
import 'package:advice_app/weather/presentation/bloc/weather_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'advice/presentation/pages/advice_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AdviceBloc>(
      create: (context) => AdviceBloc(),
    ),
    BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(),
    ),
    BlocProvider<CoffeeBloc>(
      create: (context) => CoffeeBloc(),
    ),
  ],
  child: EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      startLocale:  Locale('ar'),
      child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AdvicePage(),
    );
  }
}
