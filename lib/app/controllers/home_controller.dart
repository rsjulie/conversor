// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:conversor/app/models/currency_model.dart';

class HomeController {
  List<CurrencyModel>? currencies;
  CurrencyModel? toCurrency;
  CurrencyModel? fromCurrency;
  final TextEditingController toText;
  final TextEditingController fromText;
  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies![0];
    fromCurrency = currencies![1];
  }

  void convert() {
    String text = toText.text;
    double value = double.tryParse(text) ?? 1.0;
    double returnValue = 0;

    if (fromCurrency!.name == 'Real') {
      returnValue = value * toCurrency!.real;
    } else if (fromCurrency!.name == 'Dolar') {
      returnValue = value * toCurrency!.dolar;
    } else if (fromCurrency!.name == 'Euro') {
      returnValue = value * toCurrency!.euro;
    } else if (fromCurrency!.name == 'Bitcoin') {
      returnValue = value * toCurrency!.bitcoin;
    }

    fromText.text = returnValue.toStringAsFixed(2);
  }
}
