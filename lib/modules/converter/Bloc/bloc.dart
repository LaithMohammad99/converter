import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske_bloc_converte/config/shared_pref_kay.dart';
import 'package:taske_bloc_converte/modules/converter/Bloc/events.dart';
import 'package:taske_bloc_converte/modules/converter/Bloc/states.dart';
import 'package:taske_bloc_converte/modules/converter/data/repository.dart';
import 'package:taske_bloc_converte/utils/app_shared_preferences.dart';
import 'package:taske_bloc_converte/core/data_base/data_base_call.dart';
import 'package:taske_bloc_converte/model/currency.dart';

class ConverterBloc extends Bloc<ConversionEvent, ConversionState> {
  ConvertRepository convertRepository = ConvertRepository();
  String toSelectedCurrency = "";
  String fromSelectedCurrency = "";
  double amount = 0;
  double exchangeRate = 0;
  double result = 0.0;
  List<Currency> currencyList = [];
  bool theCurrencySaved = false;


  DatabaseHelper database = DatabaseHelper();

  static ConverterBloc get(BuildContext context) =>
      BlocProvider.of(context); // get instance block

  ConverterBloc() : super(ConversionInitial()) {
    on<FromSelectCurrency>((event, emit) async {
      fromSelectedCurrency = event.from;
      emit(FromSelectedCurrencyState());
    });

    on<ToSelectCurrency>((event, emit) async {
      toSelectedCurrency = event.to;
      emit(ToSelectedCurrencyState());
    });

    on<GetExchangeEvent>((event, emit) async {
      emit(ConversionInitial());
      amount = event.amount;
      exchangeRate = await convertRepository.requestExchangeRate(
          fromSelectedCurrency, toSelectedCurrency);

      result = amount * exchangeRate;
      emit(GetExchangeResultState());
    });

    on<GetCurrencyEvent>((event, emit) async {
      emit(LoadingGetCurrencyState());
      if (theCurrencySaved) {
        List<Map<String, dynamic>> list =
            await database.readData('select * from currency');
        print(list.length);
        currencyList = list.map((item) {
          return Currency(
            id: item['id'],
            currencyName: item['currencyName'],
            currencySymbol: item['currencySymbol'],
          );
        }).toList();
      } else {
        currencyList = await convertRepository.getCurrency();
        for (var value in currencyList) {
          await database.insertData(value);
        }
        saveCurrencyListFirstTime();
      }
      emit(GetCurrencyState());
    });
  }

  void saveCurrencyListFirstTime() async {
    theCurrencySaved = false;
    await AppSharedPreferences.setBool(currencySP, true);
  }

  void getIsCurrencyListSavedFirstTime() async {
    theCurrencySaved = (await AppSharedPreferences.getBool(currencySP)) ?? true;
  }
}
