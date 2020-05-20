import 'package:flutter/cupertino.dart';

class SCountry with ChangeNotifier {
  String _countryName = '';

  String get CountryName => _countryName;

  setCountryName(String name) {
      _countryName = name; 
  }
}