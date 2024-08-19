import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:taske_bloc_converte/core/base_app_client/base_app_client.dart';
import 'package:taske_bloc_converte/core/service/navigation_service.dart';
import 'package:taske_bloc_converte/modules/converter/Bloc/bloc.dart';
import 'package:taske_bloc_converte/modules/historical/bloc/historical_bloc.dart';

GetIt di = GetIt.instance;

void setupLocator(String baseAppUr) {

  ///Services injection
  di.registerLazySingleton(() => NavigationService());

  ///Base App client
  di.registerFactory(() => BaseAppClient(baseAppUr));

  /// Register BLoCs
  di.registerFactory(() => HistoricalBloc());
  di.registerFactory(() => ConverterBloc());
}
