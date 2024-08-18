sealed class ConversionEvent {
}
class FromSelectCurrency extends ConversionEvent {
  int index=0;

  final String from;
  FromSelectCurrency({required this.from});
}

class ToSelectCurrency extends ConversionEvent {
  final String to;
  ToSelectCurrency({required this.to});
}

class GetExchangeEvent extends ConversionEvent {
  final double amount;
  GetExchangeEvent(this.amount,);
}

class GetCurrencyEvent extends ConversionEvent {}