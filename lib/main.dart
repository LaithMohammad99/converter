import 'package:flutter/material.dart';
import 'package:taske_bloc_converte/config/theme.dart';
import 'package:taske_bloc_converte/injection/injection_container.dart';
import 'package:taske_bloc_converte/modules/converter/Bloc/bloc.dart';
import 'package:taske_bloc_converte/modules/converter/Bloc/events.dart';
import 'package:taske_bloc_converte/modules/historical/bloc/historical_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'root_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  setupLocator("https://free.currconv.com/");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => ConverterBloc()..add(GetCurrencyEvent()),
        ),
        BlocProvider(
          create: (context) => HistoricalBloc()..add(GetHistoricalDataTwo()),
        ),
      ], child: const RootPage()),
    );
  }
}
