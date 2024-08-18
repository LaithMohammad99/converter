abstract class ConversionState {}

 class ConversionInitial extends ConversionState {
  int index=0;

 }

class ToSelectedCurrencyState extends ConversionState {}
class FromSelectedCurrencyState extends ConversionState {}
class GetExchangeResultState extends ConversionState {}
class GetCurrencyState extends ConversionState{}
class LoadingGetCurrencyState extends ConversionState{}



