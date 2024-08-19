import 'package:flutter/material.dart';
import 'package:taske_bloc_converte/model/currency.dart';

class CurrencyDropdownWidget extends StatelessWidget {
  final Currency? selectedCurrency;
  final List<Currency> currencyList;
  final ValueChanged<Currency?> onCurrencyChanged;

  const CurrencyDropdownWidget({
    Key? key,
    required this.selectedCurrency,
    required this.currencyList,
    required this.onCurrencyChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButton<Currency>(
        hint: const Text("Select Currency"),
        value: selectedCurrency,
        onChanged: onCurrencyChanged,
        items: currencyList.map((Currency currency) {
          return DropdownMenuItem<Currency>(
            value: currency,
            child: Text(currency.id),
          );
        }).toList(),
      ),
    );
  }
}



