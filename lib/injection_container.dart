import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.instance;

void setupLocator(String baseAppUr) {
  di.registerLazySingleton(() => NavigationService());
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
