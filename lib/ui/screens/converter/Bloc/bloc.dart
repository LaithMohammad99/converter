import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske_bloc_converte/model/currency.dart';
import 'package:taske_bloc_converte/ui/screens/converter/Bloc/events.dart';
import 'package:taske_bloc_converte/ui/screens/converter/Bloc/states.dart';
import 'package:taske_bloc_converte/ui/screens/converter/data/repository.dart';

class ConverterBloc extends Bloc<ConversionEvent, ConversionState> {


  ConvertRepository convertRepository = ConvertRepository();
  String toSelectedCurrency = "";
  String fromSelectedCurrency = "";
  double amount = 0;
  double exchangeRate = 0;
  double result = 0.0;

   Map<String , Currency> currencyList ={};



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

    on<GetCurrencyEvent>((event, emit)async{
      currencyList = await convertRepository.getCurrency();
      emit(GetCurrencyState());


    });



  }
}
