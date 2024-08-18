import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske_bloc_converte/injection/injection_container.dart';
import 'package:taske_bloc_converte/model/currency.dart';
import 'package:taske_bloc_converte/modules/converter/Bloc/bloc.dart';
import 'package:taske_bloc_converte/modules/converter/Bloc/events.dart';
import 'package:taske_bloc_converte/modules/converter/Bloc/states.dart';


class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Converter Currency",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: CurrencyConverter(),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  String _fromCurrency = 'USD';
  String _toCurrency = 'EUR';
  double _amount = 0.0;
  TextEditingController amountController = TextEditingController();
  Currency? _selectedFromCurrency;
  Currency? _selectedToCurrency;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConverterBloc, ConversionState>(
      listener: (BuildContext context, ConversionState state) {},
      builder: (BuildContext context, ConversionState state) {
        int index=0;

        ConverterBloc converterBloc = ConverterBloc.get(context);

        return Scaffold(
          body: context.read<ConverterBloc>().currencyList.isEmpty
              ? Center(child: const CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: amountController,
                        decoration: const InputDecoration(
                          labelText: 'Amount',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _amount = double.tryParse(value) ?? 0.0;
                        } ,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButton<Currency>(
                              hint: Text("Select Currency"),
                              value: _selectedFromCurrency,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedFromCurrency = newValue;
                                  _fromCurrency = newValue!.id.toString();
                                  converterBloc.add(
                                      FromSelectCurrency(from: _fromCurrency));
                                });
                              },
                              items: converterBloc.currencyList.map((currency) {
                                return DropdownMenuItem(
                                  value: currency,
                                  child: Text(currency.id.toString()),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Icon(Icons.arrow_forward),
                          const SizedBox(width: 16),
                          Expanded(
                            child: DropdownButton<Currency>(
                              hint: Text("Select Currency"),
                              value: _selectedToCurrency,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedToCurrency = newValue;
                                  _toCurrency = newValue!.id;
                                  converterBloc
                                      .add(ToSelectCurrency(to: _toCurrency));
                                });
                              },
                              items: converterBloc.currencyList
                                  .map((Currency currency) {
                                return DropdownMenuItem(
                                  value: currency,
                                  child: Text(currency.id),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: state is ConversionInitial
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  if (_selectedToCurrency != null &&
                                      _selectedFromCurrency != null &&
                                      amountController.text != "") {
                                    converterBloc.add(GetExchangeEvent(
                                      double.parse(amountController.text),
                                    ));
                                  } else {
                                    showCustomSnackBar(context);                                  }
                                },
                                child: const Text('Convert'),
                              ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Result: ${converterBloc.result} $_toCurrency',
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

void showCustomSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(Icons.account_tree_outlined, color: Colors.white),
          SizedBox(width: 8.0),
          Expanded(child: Text('Full your missing input to Convert !')),
        ],
      ),
      backgroundColor: Colors.grey,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      duration: Duration(seconds: 3),
    ),
  );

}